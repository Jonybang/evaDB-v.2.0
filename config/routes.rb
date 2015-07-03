Rails.application.routes.draw do

  root :to => 'application#index'

  get 'logout' => 'sessions#destroy', :as => 'log_out'
  get 'login' => 'sessions#new', :as => 'log_in'
  get 'register' => 'users#new', :as => 'sign_up'

  get 'user_id' => 'application#user_id'

  resources :users
  resources :sessions

  resources :project_resources
  resources :resource_types

  get '/manager/' => 'manager#index'
  get 'manager/projects'
  get 'manager/cabinet', :as => 'cabinet'

  resources :partners

  resources :event_documents

  resources :events

  resources :finance_programs

  resources :currencies

  resources :finance_sources

  resources :projects, :defaults => {format: :json} do
    resources :project_tasks, :defaults => {format: :json}
  end

  resources :contacts do
    resources :projects
  end

  resources :project_statuses

  resources :project_directions

  resources :equip_statuses

  resources :intellect_types

  resources :intellect_properties

  resources :socnet_links

  resources :socnets

  resources :theses

  resources :papers

  resources :degrees

  resources :ranks

  resources :scientists

  resources :rooms

  resources :subunits

  resources :equips

  resources :specialties

  resources :faculties

  resources :universities

  resources :students

  resources :industries

  resources :workposts

  resources :skills

  resources :organizations

  resources :contact_data

  resources :links
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with 'rake routes'.

  # You can have the root of your site routed with 'root'
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  mount RailsAdmin::Engine => '/adminpanel', :as => 'rails_admin'
  #root :to => redirect('/adminpanel')
end
