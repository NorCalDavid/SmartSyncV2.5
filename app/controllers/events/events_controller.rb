class Events::EventsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_event, only: [:edit, :update, :delete, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:new, :create, :update]
  
  respond_to :html, :js, :json

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
     @event = Event.new(event_params)

    if @event.save
      redirect_to events_path, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(event_params)
        format.html { redirect_to events_path, :notice => 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end

  end

  def destroy 
    @event.destroy
    redirect_to events_path, notice: 'Event was successfully destroyed.'
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:id, :name, :description, :start, :finish, :all_day, :time_zone)
    end
end

