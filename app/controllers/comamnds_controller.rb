class ComamndsController < InheritedResources::Base
  before_action :authenticate_user!

  private

    def comamnd_params
      params.require(:comamnd).permit(:name, :description, :type, :resource, :endpoint)
    end
end

