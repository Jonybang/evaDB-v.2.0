class DegreesController < InheritsController

  private

    def degree_params
      params.require(:degree).permit!
    end
end

