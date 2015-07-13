class University < Base
  has_one :contact_data, as: :cdata_parent, class_name: 'ContactDatum'
  accepts_nested_attributes_for :contact_data

  has_one :link, as: :linkable
  accepts_nested_attributes_for :link

  has_many :faculties, class_name: 'Faculty', inverse_of: :university
  #accepts_nested_attributes_for :faculties, allow_destroy: true

  has_many :students, inverse_of: :university
  #accepts_nested_attributes_for :students
end
