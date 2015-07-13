class WorkPost < Base
  has_many :contacts, inverse_of: :work_post
  #accepts_nested_attributes_for :contacts
end
