class ProjectTasksController < InheritsController
  before_filter :load_parent

  def create
    project_task_params
    @task = ProjectTask.create(params[:project_task])
    redirect_to project_project_task_path(@parent, @task)
  end
  private
    def get_collection
      load_parent
      if params[:parent_task_id].nil? || params[:parent_task_id].empty?
        @collection = @parent.main_tasks
      else
        @collection = ProjectTask.find(params[:parent_task_id]).child_tasks
      end

    end
    def project_task_params
      params.require(:project_task).permit!
    end
    def load_parent
      @parent = Project.find(params[:project_id])
    end
end

