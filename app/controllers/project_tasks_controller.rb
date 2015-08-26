class ProjectTasksController < InheritsController
  before_filter :load_parent

  private
    def get_collection
      @with_resources = params[:with_resources]
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
        #project_ids = Project.where(contact_id: params[:contact_id]).map(&:_id)
        #tasks_ids = Contact.find(params[:contact_id]).performer_tasks.map(&:_id)
        #@collection = Project.where(:contact_id => params[:contact_id]).project_tasks
        @collection = ProjectTask.includes(:project).where('projects.contact_id = ?', params[:contact_id]).references(:project)
        #@collection = ProjectTask.or(:project_id.in => project_ids).or(:_id.in => tasks_ids)
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
      params.require(:project_task).permit(:id, :project_id, :parent_task_id, :name, :number, :begin_date, :end_date, :description, :status_id, :responsible_ids => [], :resources_attributes => [:id, :begin_date, :end_date, :resoursable_id, :resoursable_type, :_destroy])
    end
    def load_parent
      if params[:project_id]
        @parent = Project.find(params[:project_id])
      end
    end
end

