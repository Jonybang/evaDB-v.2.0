attribute :id, :created_at, :updated_at

node :name do |obj|
    obj.name if obj.name
end

node :class do |obj|
    resource_class
end