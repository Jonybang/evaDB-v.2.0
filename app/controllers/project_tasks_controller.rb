class ProjectTasksController < InheritsController
  before_filter :load_parent

  private
    def get_collection
      load_parent
      @collection = @parent.project_tasks.all
    end
    def project_task_params
      params.require(:project_task).permit!
    end
    def load_parent
      @parent = Project.find(params[:project_id])
    end
end

