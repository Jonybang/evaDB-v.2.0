class Specialty < Base
  belongs_to :faculty

  has_one :contact_data, as: :cdata_parent, class_name: 'ContactDatum'
  accepts_nested_attributes_for :contact_data

  has_one :link, as: :linkable
  accepts_nested_attributes_for :link

  has_many :students
  #accepts_nested_attributes_for :students
end
