class FinanceSource < Base
  has_one :contact_datum, as: :cdata_parent, class_name: 'ContactDatum'
  accepts_nested_attributes_for :contact_datum

  has_one :link, as: :linkable
  accepts_nested_attributes_for :link

  belongs_to :currency

  has_and_belongs_to_many  :projects, inverse_of: :finance_sources
  has_and_belongs_to_many  :project_directions, inverse_of: :finance_sources

  has_many :finance_programs, inverse_of: :finance_source
  #accepts_nested_attributes_for :finance_programs
end
