class University
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  embeds_one :contact_data, as: :cdata_parent, class_name: "ContactData"
  accepts_nested_attributes_for :contact_data

  #embeds_many :faculties, class_name: "Faculty", cascade_callbacks: true
  has_many :faculties, class_name: "Faculty"
  accepts_nested_attributes_for :faculties, allow_destroy: true

  has_one :link, as: :linkable
  accepts_nested_attributes_for :link

  has_many :students
  accepts_nested_attributes_for :students
end
