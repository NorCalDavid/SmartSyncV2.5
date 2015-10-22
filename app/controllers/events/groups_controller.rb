class Event::GroupsController < InheritedResources::Base
	before_action :authenticate_user!

	private

		def group_params
			params.require(:group).permit(:name, :description, :favorite, :executed_count, :executed_last, :status)
		end

		def create_params
			group_params.merge(created_by: current_user.id)
		end

		def update_params
			group_params.merge(updated_by: current_user.id)
		end
end

