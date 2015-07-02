class EventsController < InheritsController

  private

    def event_params
      params.require(:event).permit!
    end
end

