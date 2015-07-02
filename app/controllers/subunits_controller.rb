class SubunitsController < InheritsController

  private

    def subunit_params
      params.require(:subunit).permit!
    end
end

