class ActionsController < InheritedResources::Base

  private

    def action_params
      params.require(:action).permit(:name, :description, :type, :published, :action, :target_id, :command_id, :test_option_id, :execution_order, :executed_count, :executed_last, :event_condition_id)
    end
end

