class Faculty < Base
  belongs_to :university

  has_one :contact_data, as: :cdata_parent, class_name: 'ContactDatum'
  accepts_nested_attributes_for :contact_data

  has_one :link, as: :linkable
  accepts_nested_attributes_for :link

  has_many :specialties, class_name: 'Specialty', inverse_of: :faculty
  #accepts_nested_attributes_for :specialties, allow_destroy: true

  has_many :students, inverse_of: :faculty
  #accepts_nested_attributes_for :students
end
