class SpecialtiesController < InheritsController

  private

    def specialty_params
      params.require(:specialty).permit!
    end
end

