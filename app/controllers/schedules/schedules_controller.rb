class Schedules::SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_schedule, only: [:edit, :update, :delete, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:new, :create, :update]
  
  respond_to :html, :js, :json

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
     @schedule = Schedule.new(schedule_params)

    if @schedule.save
      redirect_to schedules_path, notice: 'Schedule was successfully created.'
    else
      render :new
    end
  end

  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(schedule_params)
        format.html { redirect_to schedules_path, :notice => 'Schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @schedule.errors, :status => :unprocessable_entity }
      end
    end

  end

  def destroy 
    @schedule.destroy
    redirect_to schedules_path, notice: 'Schedule was successfully destroyed.'
  end

  private

    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def schedule_params
      params.require(:schedule).permit(:id, :name, :description, :start, :finish, :all_day, :time_zone)
    end
end


#   before_action :authenticate_user!
#   before_action :set_schedule, only: [:show, :edit, :update, :destroy]
#   # respond_to :json, only: [:calendar]

#   # GET /schedules
#   def index
#     @schedules = get_user_schedules
#     if @schedules.length == 0
#       flash[:alert] = "You have no schedules. Create one now to get started."
#     end

#     @events = get_user_schedules
#     events = []
#     @events.each do |event|
#       events << {:id => event.id, :title => "#{event.title} : #{event.description}", :start => "#{event.start_time}",:end => "#{event.end_time}", :allDay => "#{event.all_day}" }
#     end

#     respond_to do |format|
#       format.html # index.html.erb
#       format.json { render :text => events.to_json }
#     end  
#   end

#    # GET /schedules
#   # GET /schedules.json
#   # def index
#   #   @schedules = Schedule.scoped
#   #   @schedules = Schedule.between(params['start'], params['end']) if (params['start'] && params['end'])
#   #   respond_to do |format|
#   #     format.html # index.html.erb
#   #     format.json { render :json => @schedules }
#   #   end
#   # end

#   # GET /schedules/:id
#   def show
#   end

#   # GET /schedules/new
#   def new
#     if session[:active_property].nil?
#       @schedule = Schedule.new
#     else
#       @schedule = Schedule.new(property_id: session[:active_property])
#     end
#   end

#   # POST /schedules
#   def create
#     Time.zone = schedule_params[:time_zone]
#     @schedule = Schedule.new(schedule_params)

#     if @schedule.save
#       redirect_to @schedule, notice: 'New schedule was successfully created.'
#     else
#       render :new
#     end

#   end

#   # GET /schedules/:id/edit
#   def edit
#   end

#   # POST /schedules/:id
#   def update

#     if @schedule.update(schedule_params)
#       redirect_to @schedule, notice: 'Schedule was successfully updated.'
#     else
#       render :edit
#     end

#   end

#   # DELETE /schedules/:id
#   def destroy
#     @schedule.destroy
#     redirect_to schedules_url, notice: 'Schedule was successfully destroyed.'
#   end

#   def calendar_feed
#     @events = get_user_schedules
#     events = []
#     @events.each do |event|
#       events << {:id => event.id, :title => "#{event.title} : #{event.description}", :start => "#{event.start_time}",:end => "#{event.end_time}" }
#     end
#     render :text => events.to_json
#   end

#   before_action :set_schedule, only: [:edit, :update, :delete, :destroy]
#   respond_to :html, :js, :json

#   def index
#     @Schedule = Schedule.all
#   end

#   def new
#     @schedule = Schedule.new
#   end

#   def create
#     @schedule = Schedule.create(schedule_params)
#   end

#   def update
#     @schedule.update_attributes(schedule_params)
#   end

#   def destroy 
#     @schedule.destroy
#   end

# # private

#   def set_schedule
#     @schedule = Schedule.find(params[:id])
#   end
  
#   def schedule_params
#     params.require(:schedule).permit(:title, :description, :frequency, :period, :start_time, :end_time, :time_zone, :all_day, :type, :published, :published_on, :favorite, :executed_count, :executed_last, :property_id)
#   end


# end
