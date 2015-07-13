class Link < Base
  belongs_to :linkable, polymorphic: true, :dependent => :destroy
end
