class SchedulesController < InheritedResources::Base
	before_action :authenticate_user!
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  respond_to :json, only: [:get_actions]
  
  def get_actions
    @actions = current_user.schedule_actions
    scheduled_actions = []
    @actions.each do |action|
      scheduled_actions << {:id => action.id, :title => "#{action.name} : #{action.description}", :start => "#{action.start}",:end => "#{action.end}" }
    end
    render :text => events.to_json
  end

  private

    def schedule_params
      params.require(:schedule).permit(:name, :description, :type, :published, :published_on, :status, :favorite, :executed_count, :executed_last, :user_id)
    end
end

