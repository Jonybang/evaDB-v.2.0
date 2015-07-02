class ProjectsController < InheritsController

  private

    def project_params
      params.require(:project).permit!
    end
end

