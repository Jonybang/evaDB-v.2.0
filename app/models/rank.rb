class Rank < Base
  has_many :scientists, class_name: 'Scientist', inverse_of: :rank
end
