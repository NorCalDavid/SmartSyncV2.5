class Event::GroupsController < InheritedResources::Base
  before_action :authenticate_user!

  private

    def group_params
      params.require(:group).permit(:name, :description, :favorite, :executed_count, :executed_last, :status)
    end
end

