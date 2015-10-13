class EventsController < InheritedResources::Base

  private

    def event_params
      params.require(:event).permit(:name, :description, :type, :published, :status, :favorite, :event_group_id)
    end
end

