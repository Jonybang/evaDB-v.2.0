class ContactDataController < ApplicationController

  private

    def contact_data_params
      params.require(:contact_data).permit!
    end
end

