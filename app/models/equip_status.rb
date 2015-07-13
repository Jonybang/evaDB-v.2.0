class EquipStatus < Base
  has_many :equips, inverse_of: :equip_status
  #accepts_nested_attributes_for :equips
end
