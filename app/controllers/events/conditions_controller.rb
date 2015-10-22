class Events::ConditionsController < InheritedResources::Base
  before_action :authenticate_user!

  private

    def condition_params
      params.require(:condition).permit(:name, :description, :type, :published, :condition, :trigger_id, :test_option_id, :test_value_one, :test_value_two)
    end

    def create_params
      condition_params.merge(created_by: current_user.id)
    end

    def update_params
      condition_params.merge(updated_by: current_user.id)
    end
end

