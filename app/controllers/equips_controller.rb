class EquipsController < InheritsController

  private

    def equip_params
      params.require(:equip).permit!
    end
end

