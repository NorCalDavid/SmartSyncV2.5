class RemindersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reminder, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :refresh_form


  # GET /reminders
  # GET /reminders.json
  def index
    @reminders = get_user_reminders
    if @reminders.length == 0
      flash[:alert] = "You have no reminders. Create one now to get started."
    end
  end

  # GET /reminders/1
  # GET /reminders/1.json
  def show
  end

  # GET /reminders/new
  def new
    @recipient_phone_number = nil
    if session[:active_property].nil?
      @reminder = Reminder.new
    else
      @property = Property.find(session[:active_property])
      @reminder = Reminder.new(property_id: session[:active_property])
    end
    @min_date = DateTime.now
  end

  # GET /reminders/1/edit
  def edit
  end

  # POST /reminders
  # POST /reminders.json
  def create
    Time.zone = reminder_params[:time_zone]
    @reminder = Reminder.new(reminder_params)
    
    if @reminder.save
      redirect_to @reminder, notice: 'Reminder was successfully created.'
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      # @time_str = (params["notification_time"].localtime).strftime("%I:%M%p on %b. %d, %Y")

      @body = "Hi #{@reminder.name}.\nYour reminder from SmartSync Home is coming up at #{@time_str}.\nReminder Content: #{@reminder.description}"
      
      @client.messages.create(  from: ENV['TWILIO_NUMBER'],
                                to: @reminder.recipient_phone_number,
                                body: @body )
    else
      render :new
    end

  end

  # PATCH/PUT /reminders/1
  # PATCH/PUT /reminders/1.json
  def update
    
    if @reminder.update(reminder_params)
      redirect_to @reminder, notice: 'Reminder was successfully updated.'
    else
      render :edit
    end

  end

  # DELETE /reminders/1
  # DELETE /reminders/1.json
  def destroy
    @reminder.destroy
    redirect_to reminders_url, notice: 'Reminder was successfully destroyed.'
  end

  def refresh_form
    if request.xhr?
      unless params[:recipient_id].nil?
        ap params
        @recipient_phone_number = User.find(params[:recipient_id]).mobile
        render :text => @recipient_phone_number.to_json, status: :ok
        return
      end

      unless params[:property_id].nil?
        ap params
        @property = Property.find(params[:property_id])
        render partial: 'reminders/select_property', status: :ok, location: reminders_path(@property)
        return
      end
    end
    render nothing: true, status: :error
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # See above ---> before_action :set_reminder, only: [:show, :edit, :update, :destroy]
    def set_reminder
      @reminder = Reminder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reminder_params
      params.require(:reminder).permit(:name, :description, :recipient_id, :recipient_phone_number, :notification_time, :time_zone, :property_id)
    end

end
