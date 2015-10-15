class EventGroupsController < InheritedResources::Base
  before_action :authenticate_user!

  private

    def event_group_params
      params.require(:event_group).permit(:name, :description, :favorite, :executed_count, :executed_last, :status)
    end
end

