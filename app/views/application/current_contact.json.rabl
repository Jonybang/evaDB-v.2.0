object @contact
attribute :_id => :id
attributes :name, :created_at, :updated_at
glue(:contact_data) {|contact| attribute :email }