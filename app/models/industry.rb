class Industry < Base
  has_and_belongs_to_many :contacts, inverse_of: :industries
end
