class InheritsController < ApplicationController
  inherit_resources
  #actions :all
  respond_to :json
  before_action :get_collection, only: :index
  before_action :get_resource, only: [:show]

  skip_before_action :verify_authenticity_token

  def create
    create! do
      #redirect_to action: 'show'
      #render :show and return
      redirect_to :action => :show
    end
  end
  protected
    def get_collection
      @collection = collection
    end
    def get_resource
      @resource = resource
    end
end
