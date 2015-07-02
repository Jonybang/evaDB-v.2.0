class RoomsController < InheritsController

  private

    def room_params
      params.require(:room).permit!
    end
end

