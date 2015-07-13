class Contact < Base

  belongs_to :user
  belongs_to :organization, inverse_of: :contacts, class_name: 'Organization'
  belongs_to :work_post

  has_one :contact_data, as: :cdata_parent, class_name: 'ContactDatum'
  accepts_nested_attributes_for :contact_data, :allow_destroy => true

  has_many :project_resources, as: :resoursable, class_name: 'ProjectResource'

  has_many :equips, class_name: 'Equip', inverse_of: :responsible
  #accepts_nested_attributes_for :equips

  has_many :socnet_links, class_name: 'SocnetLink', as: :linkable
  #accepts_nested_attributes_for :socnet_links

  has_many :project_tasks, class_name: 'ProjectTask', inverse_of: :responsible
  #accepts_nested_attributes_for :project_tasks

  has_and_belongs_to_many :skills, inverse_of: :contacts
  has_and_belongs_to_many :industries, class_name: 'Industry', inverse_of: :contacts
  has_and_belongs_to_many :intellect_properties, class_name: 'IntellectProperty', inverse_of: :authors

  has_many :chief_projects, class_name: 'Project', inverse_of: :chief
  #accepts_nested_attributes_for :chief_projects

  has_and_belongs_to_many :team_projects, class_name: 'Project', inverse_of: :team
  has_and_belongs_to_many :expert_projects, class_name: 'Project', inverse_of: :experts

  has_and_belongs_to_many :member_events, class_name: 'Event', inverse_of: :members

  has_and_belongs_to_many :performer_tasks, class_name: 'ProjectTask', inverse_of: :performers
end
