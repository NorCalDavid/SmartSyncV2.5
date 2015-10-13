class EventActionsController < InheritedResources::Base

  private

    def event_action_params
      params.require(:event_action).permit(:name, :description, :type, :published, :action, :target_id, :command_id, :test_option_id, :execution_order, :executed_count, :executed_last, :event_condition_id)
    end
end

