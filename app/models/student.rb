class Student < Contact
  belongs_to :specialty
  belongs_to :faculty
  belongs_to :university
end
