class ComamndsController < InheritedResources::Base

  private

    def comamnd_params
      params.require(:comamnd).permit(:name, :description, :type, :resource, :endpoint)
    end
end

