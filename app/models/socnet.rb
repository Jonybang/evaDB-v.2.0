class Socnet < Base
  has_many :socnet_links, as: :linkable, class_name: 'SocnetLink'
  #accepts_nested_attributes_for :socnet_links
end
