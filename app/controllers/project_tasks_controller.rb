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

      if params[:contact_id]

        # project_ids_set = Set.new []
        # Project.each do |project|
        #   if (project._id == params[:contact_id]) || (params[:contact_id].in project.team.map(&:_id))
        #     project_ids_set.add(project._id)
        #   end
        # end
        project_ids = Project.where(chief_id: params[:contact_id]).map(&:_id)
        tasks_ids = Contact.find(params[:contact_id]).performer_tasks.map(&:_id)
        @collection = ProjectTask.or(:project_id.in => project_ids).or(:_id.in => tasks_ids)
        #@collection = Contact.find(params[:contact_id]).performer_tasks
        #@collection = ProjectTask.where()
        #@collection = ProjectTask.has_contact params[:contact_id]
        #@collection = ProjectTask.includes(:project).where(:"project.chief_id" => params[:contact_id])
        #@collection = ProjectTask.find_all { |task| task.chief_id == params[:contact_id] }
                                  #.where(responsible: params[:contact_id])
                                  #.union
                                  #.find_all { |task| task.chief_id == params[:contact_id] }
                                  #.where(:project.chief.id => params[:contact_id])
                                  #.where(params[:contact_id].in :performers.map(&:id))
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

