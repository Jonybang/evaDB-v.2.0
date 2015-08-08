class ResoursableController < ApplicationController
  def index
    @collection = Contact.all + Equip.all
    render 'inherits/index'
  end
end