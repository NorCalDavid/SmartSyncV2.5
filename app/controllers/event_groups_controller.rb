class EventGroupsController < InheritedResources::Base

  private

    def event_group_params
      params.require(:event_group).permit(:name, :description, :favorite, :executed_count, :executed_last, :status)
    end
end

