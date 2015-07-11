class ProjectTasksController < InheritsController
  before_filter :load_parent

  private
    def get_collection
      load_parent
      if params[:parent_task_id]
        @collection = ProjectTask.find(params[:parent_task_id]).child_tasks
      elsif @parent
        @collection = @parent.main_tasks
      else
        @collection = sort_and_paging ProjectTask.all
      end

    end
    def project_task_params
      params.require(:project_task).permit!
    end
    def load_parent
      if params[:project_id]
        @parent = Project.find(params[:project_id])
      end
    end
end

