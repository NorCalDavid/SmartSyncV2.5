class LocationOptionsController < InheritedResources::Base

  private

    def location_option_params
      params.require(:location_option).permit()
    end
end

