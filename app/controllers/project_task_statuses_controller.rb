class ProjectTaskStatusesController < InheritsController

  private

    def project_task_status_params
      params.require(:project_task_status).permit!
    end
end

