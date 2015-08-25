class Base < ActiveRecord::Base
  self.abstract_class = true

  #attr_accessor :name

  def to_s
    name
  end

  def _destroy=(val)
    self.destroy
  end
end