class OrganizationsController < InheritsController
  private

    def organization_params
      params.require(:organization).permit!
    end
end

