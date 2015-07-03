class ProjectsController < InheritsController
  before_filter :load_contact
  def index
    #@collection = Project.where(params[:project])
    @collection = Project.where(:chief_id => params[:chief_id])
    # if @contact
    #   @projects = @contact.projects.all
    # else
    #   @projects = Project.all
    # end
    #index!
  end

  private

    def project_params
      params.require(:project).permit!
    end

    def load_contact
      if params[:contact_id]
        @contact = Contact.find(params[:contact_id])
      end
    end
end

