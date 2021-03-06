Rails.application.routes.draw do

  resources :role_users

  #resources :roles

  resources :roles do
		collection do
			get 'sign_in'
		end
	end


  resources :conference_people

  resources :theses

  resources :author_requests

  resources :author_monographs

  resources :people_reports

  resources :people_textbooks

  resources :people_research_efforts

  resources :licence_people

  resources :exhibit_people

  resources :exhibition_people

  resources :diploma_people

  resources :textbooks

  resources :monographs

  resources :diplomas

  resources :exhibits

  resources :exhibitions

  resources :article_authors

  resources :users

  resources :reports

  resources :conferences

  resources :licences

  resources :ois_requests

  resources :documents

  resources :research_efforts

  resources :scientific_schools

  resources :state_programs

  resources :nir_types

  resources :sources

  resources :fields

  resources :grntis

  resources :articles

  resources :people

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
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
  
  get  "application/logout"
  get  "application/change_role"
  # get  "roles/sign_in"
  #root :to => "people#index"
  root :to => "people#start_layout" 
  #get  'roles/access_denied' => 'roles#access_denied'
end
