class These < Base
  belongs_to :scientist, class_name: 'Scientist', :inverse_of => :theses
end
