class DevicesController < InheritedResources::Base

  private

    def device_params
      params.require(:device).permit()
    end
end

