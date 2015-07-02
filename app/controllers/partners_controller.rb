class PartnersController < InheritsController

  private

    def partner_params
      params.require(:partner).permit!
    end
end

