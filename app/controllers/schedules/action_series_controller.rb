class Schedules::ActionSeriesController < InheritedResources::Base
before_action :authenticate_user!
  before_action :set_action, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  def index
  end

  # GET /schedules/:id
  def show
  end

  # GET /schedules/new
  def new
  end

  # POST /schedules
  def create
  end

  # GET /schedules/:id/edit
  def edit
  end

  # POST /schedules/:id
  def update
  end

  # DELETE /schedules/:id
  def destroy
  end

private

  def set_action_series
  end
  
  def action_series_params
    params.require(:action_series).permit(:name, :description, :type, :published, :published_on, :action, :target_id, :command_id, :executed_count, :executed_last, :schedule_id, :status)
  end
end

