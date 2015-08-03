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