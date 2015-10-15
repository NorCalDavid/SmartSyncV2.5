class ConditionsController < InheritedResources::Base

  private

    def condition_params
      params.require(:condition).permit(:name, :description, :type, :published, :condition, :trigger_id, :test_option_id, :test_value_one, :test_value_two)
    end
end

