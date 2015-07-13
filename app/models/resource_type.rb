class ResourceType < Base
  has_many :resources, class_name: 'ProjectResource', inverse_of: :resource_type
  #accepts_nested_attributes_for :resources
end
