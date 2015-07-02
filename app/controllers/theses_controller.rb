class ThesesController < InheritsController

  private

    def these_params
      params.require(:these).permit!
    end
end

