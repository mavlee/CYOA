TwitterClone::Application.routes.draw do
  get "sessions/new"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  resources :stories, controller: "stories"
  resources :stories do
    member do
      get 'view'
    end
  end
  resources :storypaths, controller: "storypaths"
  resources :users, controller: "user"
  resources :sessions, :only => [:new, 
                                 :create, # url = /sessions, named route = sessions_path, action = create, purpose = create a new session 
                                 :destroy]
  
  root :to => "frontpage#frontpage"
  match "frontpage" => "frontpage#frontpage"
  
  match "sign_up" => "users#sign_up"
  match "sign_in" => "sessions#new"
  match "sign_out" => "sessions#destroy"
  
  match "show" => "users#show"
  match "show_all" => "users#show_all"
  match "dashboard" => "users#dashboard"
  match "home" => "users#home"
  match "user_create" => "users#create"
end
