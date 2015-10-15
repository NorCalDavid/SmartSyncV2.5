class StatusOptionsController < InheritedResources::Base
  before_action :authenticate_user!

  private

    def status_option_params
      params.require(:status_option).permit()
    end
end

