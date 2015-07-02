class FinanceSourcesController < InheritsController

  private

    def finance_source_params
      params.require(:finance_source).permit!
    end
end

