object @resource
attribute :id, :name, :created_at, :updated_at
attribute :description, :number, :begin_date, :end_date

child(:project_status) { attributes :id, :name, :color }
child :responsible => :contact do
    attributes :id, :name
end
child :project do
    attributes :id, :name
end
child :performers, :root => "performers", :object_root => false do
    attributes :id, :name
end