class ProjectsController < InheritsController
  before_filter :load_contact

  private
    def get_collection
      @with_tasks = params[:with_tasks]
      if params[:contact_id]
        @collection = Project.where(:contact_id => params[:contact_id])
      else
        @collection = Project.all
      end
    end

    def project_params
      params.require(:project).permit!
    end

    def load_contact
      if params[:contact_id]
        @contact = Contact.find(params[:contact_id])
      end
    end
end