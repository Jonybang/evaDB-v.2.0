class InheritsController < ApplicationController
  inherit_resources

  respond_to :json
  before_action :get_collection, only: :index
  before_action :get_resource, only: :show

  def create
    create! { @resource }
  end
  protected
    def get_resource
      @resource = resource
    end
    def get_collection
      @collection = sort_and_paging collection
    end
    def sort_and_paging(collection)
      if params[:sort]
        collection = collection.sorted(true, params[:sort])
      end
      if params[:limit]
        collection = collection.limit(params[:limit])
      end
      collection
    end
end
