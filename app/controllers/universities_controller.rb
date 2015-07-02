class UniversitiesController < InheritsController

  private

    def university_params
      params.require(:university).permit!
    end
end

