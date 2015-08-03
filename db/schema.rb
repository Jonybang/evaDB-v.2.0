# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150713212453) do

  create_table "contact_data", force: :cascade do |t|
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "cdata_parent_id"
    t.string   "cdata_parent_type"
  end

  add_index "contact_data", ["cdata_parent_type", "cdata_parent_id"], name: "index_contact_data_on_cdata_parent_type_and_cdata_parent_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "name",            null: false
    t.date     "enter_year"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.integer  "work_post_id"
    t.integer  "specialty_id"
    t.integer  "faculty_id"
    t.integer  "university_id"
    t.integer  "degree_id"
    t.integer  "rank_id"
    t.string   "type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "contacts", ["degree_id"], name: "index_contacts_on_degree_id"
  add_index "contacts", ["faculty_id"], name: "index_contacts_on_faculty_id"
  add_index "contacts", ["organization_id"], name: "index_contacts_on_organization_id"
  add_index "contacts", ["rank_id"], name: "index_contacts_on_rank_id"
  add_index "contacts", ["specialty_id"], name: "index_contacts_on_specialty_id"
  add_index "contacts", ["university_id"], name: "index_contacts_on_university_id"
  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id"
  add_index "contacts", ["work_post_id"], name: "index_contacts_on_work_post_id"

  create_table "contacts_events", id: false, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "event_id"
  end

  add_index "contacts_events", ["contact_id"], name: "index_contacts_events_on_contact_id"
  add_index "contacts_events", ["event_id"], name: "index_contacts_events_on_event_id"

  create_table "contacts_industries", id: false, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "industry_id"
  end

  add_index "contacts_industries", ["contact_id"], name: "index_contacts_industries_on_contact_id"
  add_index "contacts_industries", ["industry_id"], name: "index_contacts_industries_on_industry_id"

  create_table "contacts_intellect_properties", id: false, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "intellect_property_id"
  end

  add_index "contacts_intellect_properties", ["contact_id"], name: "index_contacts_intellect_properties_on_contact_id"
  add_index "contacts_intellect_properties", ["intellect_property_id"], name: "index_contacts_intellect_properties_on_intellect_property_id"

  create_table "contacts_project_tasks", id: false, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "project_task_id"
  end

  add_index "contacts_project_tasks", ["contact_id"], name: "index_contacts_project_tasks_on_contact_id"
  add_index "contacts_project_tasks", ["project_task_id"], name: "index_contacts_project_tasks_on_project_task_id"

  create_table "contacts_projects", id: false, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "project_id"
  end

  add_index "contacts_projects", ["contact_id"], name: "index_contacts_projects_on_contact_id"
  add_index "contacts_projects", ["project_id"], name: "index_contacts_projects_on_project_id"

  create_table "contacts_skills", id: false, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "skill_id"
  end

  add_index "contacts_skills", ["contact_id"], name: "index_contacts_skills_on_contact_id"
  add_index "contacts_skills", ["skill_id"], name: "index_contacts_skills_on_skill_id"

  create_table "currencies", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degrees", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equip_statuses", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equips", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "model"
    t.string   "description"
    t.string   "parameters"
    t.integer  "contact_id"
    t.integer  "organization_id"
    t.integer  "subunit_id"
    t.integer  "room_id"
    t.integer  "equip_status_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "equips", ["contact_id"], name: "index_equips_on_contact_id"
  add_index "equips", ["equip_status_id"], name: "index_equips_on_equip_status_id"
  add_index "equips", ["organization_id"], name: "index_equips_on_organization_id"
  add_index "equips", ["room_id"], name: "index_equips_on_room_id"
  add_index "equips", ["subunit_id"], name: "index_equips_on_subunit_id"

  create_table "equips_project_tasks", id: false, force: :cascade do |t|
    t.integer "equip_id"
    t.integer "project_task_id"
  end

  add_index "equips_project_tasks", ["equip_id"], name: "index_equips_project_tasks_on_equip_id"
  add_index "equips_project_tasks", ["project_task_id"], name: "index_equips_project_tasks_on_project_task_id"

  create_table "event_documents", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "comments"
    t.string   "to_do"
    t.string   "url"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_documents", ["event_id"], name: "index_event_documents_on_event_id"

  create_table "events", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experts_events", id: false, force: :cascade do |t|
    t.integer "partner_id"
    t.integer "event_id"
  end

  add_index "experts_events", ["event_id"], name: "index_experts_events_on_event_id"
  add_index "experts_events", ["partner_id"], name: "index_experts_events_on_partner_id"

  create_table "faculties", force: :cascade do |t|
    t.string   "name",          null: false
    t.integer  "university_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "faculties", ["university_id"], name: "index_faculties_on_university_id"

  create_table "finance_programs", force: :cascade do |t|
    t.string   "name",              null: false
    t.string   "terms"
    t.integer  "finance_source_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "finance_programs", ["finance_source_id"], name: "index_finance_programs_on_finance_source_id"

  create_table "finance_sources", force: :cascade do |t|
    t.string   "name",        null: false
    t.float    "volume_from"
    t.float    "volume_to"
    t.integer  "currency_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "finance_sources", ["currency_id"], name: "index_finance_sources_on_currency_id"

  create_table "finance_sources_projects", id: false, force: :cascade do |t|
    t.integer "finance_source_id"
    t.integer "project_id"
  end

  add_index "finance_sources_projects", ["finance_source_id"], name: "index_finance_sources_projects_on_finance_source_id"
  add_index "finance_sources_projects", ["project_id"], name: "index_finance_sources_projects_on_project_id"

  create_table "industries", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intellect_properties", force: :cascade do |t|
    t.string   "name",              null: false
    t.string   "ind_number"
    t.string   "description"
    t.string   "formula"
    t.date     "reg_date"
    t.date     "end_date"
    t.string   "doc_link"
    t.integer  "intellect_type_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "intellect_properties", ["intellect_type_id"], name: "index_intellect_properties_on_intellect_type_id"

  create_table "intellect_properties_projects", id: false, force: :cascade do |t|
    t.integer "intellect_property_id"
    t.integer "project_id"
  end

  add_index "intellect_properties_projects", ["intellect_property_id"], name: "index_intellect_properties_projects_on_intellect_property_id"
  add_index "intellect_properties_projects", ["project_id"], name: "index_intellect_properties_projects_on_project_id"

  create_table "intellect_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "url",           null: false
    t.string   "note"
    t.integer  "socnet_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "linkable_id"
    t.string   "linkable_type"
  end

  add_index "links", ["linkable_type", "linkable_id"], name: "index_links_on_linkable_type_and_linkable_id"
  add_index "links", ["socnet_id"], name: "index_links_on_socnet_id"

  create_table "organizations", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "requisites"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "papers", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "scientist_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "papers", ["scientist_id"], name: "index_papers_on_scientist_id"

  create_table "project_directions", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_resources", force: :cascade do |t|
    t.string   "value"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.integer  "resource_type_id"
    t.integer  "project_id"
    t.integer  "project_task_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "resoursable_id"
    t.string   "resoursable_type"
  end

  add_index "project_resources", ["project_id"], name: "index_project_resources_on_project_id"
  add_index "project_resources", ["project_task_id"], name: "index_project_resources_on_project_task_id"
  add_index "project_resources", ["resource_type_id"], name: "index_project_resources_on_resource_type_id"
  add_index "project_resources", ["resoursable_type", "resoursable_id"], name: "index_project_resources_on_resoursable_type_and_resoursable_id"

  create_table "project_statuses", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_tasks", force: :cascade do |t|
    t.string   "name",              null: false
    t.integer  "number"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.string   "description"
    t.integer  "project_id"
    t.integer  "parent_task_id"
    t.integer  "project_status_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "project_tasks", ["parent_task_id"], name: "index_project_tasks_on_parent_task_id"
  add_index "project_tasks", ["project_id"], name: "index_project_tasks_on_project_id"
  add_index "project_tasks", ["project_status_id"], name: "index_project_tasks_on_project_status_id"

  create_table "project_tasks_responsible", id: false, force: :cascade do |t|
    t.integer "project_task_id"
    t.integer "contact_id"
  end

  add_index "project_tasks_responsible", ["contact_id"], name: "index_project_tasks_responsible_on_contact_id"
  add_index "project_tasks_responsible", ["project_task_id"], name: "index_project_tasks_responsible_on_project_task_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name",                 null: false
    t.string   "description"
    t.string   "result"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.integer  "project_status_id"
    t.integer  "project_direction_id"
    t.integer  "contact_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "projects", ["contact_id"], name: "index_projects_on_contact_id"
  add_index "projects", ["project_direction_id"], name: "index_projects_on_project_direction_id"
  add_index "projects", ["project_status_id"], name: "index_projects_on_project_status_id"

  create_table "ranks", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "subunit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rooms", ["subunit_id"], name: "index_rooms_on_subunit_id"

  create_table "skills", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socnets", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialties", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "specialties", ["faculty_id"], name: "index_specialties_on_faculty_id"

  create_table "sponsors_events", id: false, force: :cascade do |t|
    t.integer "partner_id"
    t.integer "event_id"
  end

  add_index "sponsors_events", ["event_id"], name: "index_sponsors_events_on_event_id"
  add_index "sponsors_events", ["partner_id"], name: "index_sponsors_events_on_partner_id"

  create_table "subunits", force: :cascade do |t|
    t.string   "name",            null: false
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "subunits", ["organization_id"], name: "index_subunits_on_organization_id"

  create_table "theses", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "scientist_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "theses", ["scientist_id"], name: "index_theses_on_scientist_id"

  create_table "universities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",              null: false
    t.string   "encrypted_password"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "work_posts", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
