class Schedules::SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  respond_to :json, only: [:get_actions]

  # GET /schedules
  def index
    @schedules = current_user.schedules.all
    if @schedules.length == 0
      flash[:alert] = "You have no schedules. Create one now to get started."
    end  
  end

  # GET /schedules/:id
  def show
  end

  # GET /schedules/new
  def new
    @schedule = current_user.schedules.new
  end

  # POST /schedules
  def create
    Time.zone = schedule_params[:time_zone]
    @schedule = current_user.schedules.new(schedule_params)

    if @schedule.save
      redirect_to @schedule, notice: 'New schedule was successfully created.'
    else
      render :new
    end

  end

  # GET /schedules/:id/edit
  def edit
  end

  # POST /schedules/:id
  def update

    if @schedule.update(schedule_params)
      redirect_to @schedule, notice: 'Schedule was successfully updated.'
    else
      render :edit
    end

  end

  # DELETE /schedules/:id
  def destroy
    @schedule.destroy
    redirect_to schedules_url, notice: 'Schedule was successfully destroyed.'
  end

  def get_actions
    @actions = current_user.schedule_actions
    scheduled_actions = []
    @actions.each do |action|
      scheduled_actions << {:id => action.id, :title => "#{action.name} : #{action.description}", :start => "#{action.start}",:end => "#{action.end}" }
    end
    render :text => scheduled_actions.to_json
  end

private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
  
  def schedule_params
    params.require(:schedule).permit(:name, :description, :type, :published, :published_on, :status, :favorite, :executed_count, :executed_last, :user_id)
  end


end
