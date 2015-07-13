class Degree < Base
  has_many :scientists, class_name: 'Scientist', inverse_of: :degree
end

