class Room < Base
  belongs_to :subunit

  has_many :equips, class_name: 'Equip', inverse_of: :room
  #accepts_nested_attributes_for :equips
end
