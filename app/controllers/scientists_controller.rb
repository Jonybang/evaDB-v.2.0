class ScientistsController < InheritsController

  private

    def scientist_params
      params.require(:scientist).permit!
    end
end

