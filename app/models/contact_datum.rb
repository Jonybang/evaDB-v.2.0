class ContactDatum < ActiveRecord::Base
  belongs_to :cdata_parent, polymorphic: true
end
