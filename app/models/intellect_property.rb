class IntellectProperty < Base
  belongs_to :intellect_type

  has_and_belongs_to_many :authors, class_name: 'Contact', inverse_of: :intellect_properties
  has_and_belongs_to_many :projects, class_name: 'Project', inverse_of: :intellect_properties
end
