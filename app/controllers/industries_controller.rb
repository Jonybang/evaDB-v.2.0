class IndustriesController < InheritsController

  private

    def industry_params
      params.require(:industry).permit!
    end
end

