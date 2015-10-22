class Events::ActionsController < InheritedResources::Base
  before_action :authenticate_user!

  private

    def action_params
      params.require(:action).permit(:name, :description, :type, :published, :action, :target_id, :command_id, :test_option_id, :execution_order, :executed_count, :executed_last, :event_condition_id)
    end

    def create_params
      action_params.merge(created_by: current_user.id)
    end

    def update_params
      action_params.merge(updated_by: current_user.id)
    end
end

