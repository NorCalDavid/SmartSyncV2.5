class ScheduleActionsController < InheritedResources::Base

  private

    def schedule_action_params
      params.require(:schedule_action).permit(:name, :description, :type, :published, :published_on, :action, :target_id, :command_id, :executed_count, :executed_last, :schedule_id, :status)
    end
end

