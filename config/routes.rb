Pmis::Application.routes.draw do
 
 resources :rank_carts do
  collection do
   get :edit_multiple
   put :update_multiple
  end
 end

 resources :selections do
  collection do
   get :general
   get :social
   get :economic
   get :other
   put :select
   put :unselect
   get :finalist
  end
 end

=begin
 scope path: "/selections", controller: :selections do
  get "index" => :index
  get "general" => :general
  get "social" => :social
  get "economic" => :economic
  get "other" => :other
 end
=end

 resources :rank_criteria
 resources :blogs
 resources :issues
 resources :departments
 resources :sectors
 resources :cities

 resources :docus do
  collection do
   get 'about'
   get 'contact'
   get 'developer'
   get 'support'
  end
 end

 #match "docu/index",
 # :to => "docu#index",
 # :via => :get
 # Devise route
 devise_for :users, path_names: { sign_in: "login", sign_out: "logout" }

 
 # Polymorphic routes
 resources :portfolios do
  resources :relations
  resources :pests
  resources :risks
  resources :in_lines
  collection do
   get 'appeal'
   get 'decision'
   get 'submit_appeal'
   get 'review'
  end
 end

 resources :programs do
  resources :relations
  resources :pests
  resources :risks
  resources :in_lines
 end
 
 resources :projects do
  resources :relations
  resources :pests
  resources :risks
  resources :in_lines
 end

 resources :activities do
  resources :relations
  resources :pests
  resources :risks
  resources :in_lines
 end
 # if no route found, default will look at root
 # root :to => "docu#index"
 root "docus#index"

 # with format like JSON
 #  match ':controller(/:action(/:id(.:format)))', :via => :get


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
  
#  match ':controller(/:action(/:id))', via: :all 
end
