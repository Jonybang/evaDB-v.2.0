collection @collection

extends "inherits/base"

attribute :description, :number, :begin_date, :end_date

child(:project_status) { attributes :id, :name, :color }

child :responsible, :root => "responsible", :object_root => false do
    attributes :id, :name
end

child :project do
    attributes :id, :name
end

if @with_resources
    child :resources, :root => "resources", :object_root => false do
        attributes :id, :value, :begin_date, :end_date, :time
        child(:resoursable, :root => "resoursable") { attributes :id, :name, :class }
    end
end
