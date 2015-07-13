class Organization < Base
  has_one :contact_data, as: :cdata_parent, class_name: 'ContactDatum'
  accepts_nested_attributes_for :contact_data

  has_one :link, as: :linkable
  accepts_nested_attributes_for :link

  has_many :contacts, inverse_of: :organization
  #accepts_nested_attributes_for :contacts

  has_many :equips, class_name: 'Equip', inverse_of: :organization
  #accepts_nested_attributes_for :equips

  has_many :subunits, class_name: 'Subunit', inverse_of: :organization
  #accepts_nested_attributes_for :subunits
end
