class ProjectResourcesController < InheritsController
  private

    def project_resource_params
      params.require(:project_resource).permit(:id, :project_id, :project_task_id, :resoursable_type, :resoursable_id, :begin_date, :end_date)
      #params.require(:project_resource).permit(:name, :default_value)
    end

    def get_collection
      if params[:resoursable_id] && params[:resoursable_type]
        @collection = ProjectResource.where(resoursable_id: params[:resoursable_id], resoursable_type: params[:resoursable_type])
      else
        @collection = ProjectResource.all
      end
    end
end
