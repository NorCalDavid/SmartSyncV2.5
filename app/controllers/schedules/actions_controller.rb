class Schedules::ActionsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_action, only: [:show, :edit, :update, :destroy]

  # GET /schedule_actions
  def index
    @schedule_actions = Schedule.find(params[:schedule_id]).schedule_actions.all
    if @schedule_actions.length == 0
      flash[:alert] = "You have no schedule actions. Create one now to get started."
    end 
  end

  # GET /schedules/:id
  def show
  end

  # GET /schedules/new
  def new
    @schedule_action = Schedule.find(params[:schedule_id]).schedule_actions.new
  end

  # POST /schedules
  def create
    Time.zone = action_params[:time_zone]
    @schedule_action = Schedule.find(params[:schedule_id]).schedule_actions.new(create_params)

    if @schedule_action.save
      redirect_to @schedule_action, notice: 'New schedule action was successfully created.'
    else
      render :new
    end
  end

  # GET /schedules/:id/edit
  def edit
  end

  # POST /schedules/:id
  def update
    if @schedule_action.update(update_params)
      redirect_to @ction, notice: 'Schedule action was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /schedules/:id
  def destroy
     @schedule_action.destroy
    redirect_to schedule_actions_url, notice: 'Schedule action was successfully destroyed.'
  end

private

  def set_action
  end
  
  def action_params
    params.require(:action).permit(:name, :description, :type, :published, :published_on, :action, :target_id, :command_id, :executed_count, :executed_last, :schedule_id, :status)
  end

  def create_params
    action_params.merge(created_by: current_user.id)
  end

  def update_params
    action_params.merge(updated_by: current_user.id)
  end


end

