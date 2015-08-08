collection @collection

extends "inherits/base"

node :time do |resource|
    resource.time
end

glue :resoursable do
  attributes :id => :resoursable_id
end

node :resoursable_class do |resource|
    resource.resoursable.class.name
end