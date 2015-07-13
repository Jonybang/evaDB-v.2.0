class Currency < Base
  has_many :finance_sources, class_name: 'FinanceSource', inverse_of: :currency
  #accepts_nested_attributes_for :finance_sources
end
