attributes :value, :resoursable_id, :resoursable_type, :begin_date, :end_date

node :resoursable_class do |resource|
    resource.resoursable.class.name
end

node :time do |resource|
    resource.time
end