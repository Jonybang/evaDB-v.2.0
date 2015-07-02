class WorkpostsController < InheritsController

  private

    def workpost_params
      params.require(:workpost).permit!
    end
end

