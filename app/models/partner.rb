class Partner < Contact
  has_and_belongs_to_many :sponsor_events, class_name: 'Event', inverse_of: :sponsors, join_table: 'sponsors_events'
  has_and_belongs_to_many :expert_events, class_name: 'Event', inverse_of: :experts, join_table: 'experts_events'
end
