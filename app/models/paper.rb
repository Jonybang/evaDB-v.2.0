class Paper < Base
  belongs_to :scientist, class_name: 'Scientist', :inverse_of => :papers
end
