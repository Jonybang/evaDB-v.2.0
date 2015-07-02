class LinksController < InheritsController

  private

    def link_params
      params.require(:link).permit!
    end
end

