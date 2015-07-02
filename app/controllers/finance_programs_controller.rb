class FinanceProgramsController < InheritsController

  private

    def finance_program_params
      params.require(:finance_program).permit!
    end
end

