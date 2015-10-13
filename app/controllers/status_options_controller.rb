class StatusOptionsController < InheritedResources::Base

  private

    def status_option_params
      params.require(:status_option).permit()
    end
end

