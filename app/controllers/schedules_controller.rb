class SchedulesController < InheritedResources::Base

  private

    def schedule_params
      params.require(:schedule).permit(:name, :description, :type, :published, :published_on, :status, :favorite, :executed_count, :executed_last, :user_id)
    end
end

