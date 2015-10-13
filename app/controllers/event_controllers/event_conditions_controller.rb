class EventConditionsController < InheritedResources::Base

  private

    def event_condition_params
      params.require(:event_condition).permit(:name, :description, :type, :published, :condition, :trigger_id, :test_option_id, :test_value_one, :test_value_two)
    end
end

