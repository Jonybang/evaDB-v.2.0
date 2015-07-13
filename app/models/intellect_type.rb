class IntellectType < Base

  has_many :intellect_properties, class_name: 'IntellectProperty'
  #accepts_nested_attributes_for :intellect_properties
end
