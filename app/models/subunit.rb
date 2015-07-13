class Subunit < Base
  belongs_to :organization

  has_one :contact_data, as: :cdata_parent, class_name: 'ContactDatum'
  accepts_nested_attributes_for :contact_data

  has_one :link, as: :linkable
  accepts_nested_attributes_for :link

  has_many :rooms, class_name: 'Room'
  #accepts_nested_attributes_for :rooms

  has_many :equips, class_name: 'Equip'
  #accepts_nested_attributes_for :equips
end
