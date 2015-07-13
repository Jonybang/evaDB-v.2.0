class Scientist < Contact
  belongs_to :degree
  belongs_to :rank

  has_many :papers, class_name: 'Paper', dependent: :destroy, inverse_of: :scientist
  #accepts_nested_attributes_for :papers, allow_destroy: true
  has_many :thesis, class_name: 'These', dependent: :destroy, inverse_of: :scientist
  #accepts_nested_attributes_for :thesis, allow_destroy: true
end
