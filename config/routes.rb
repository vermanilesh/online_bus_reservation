OnlineBusReservation::Application.routes.draw do

  
  #get "reservations/new"

  get "welcome/sign_up"
  get "welcome/sign_in"
  get "welcome/about_us"
  get "welcome/services"
  
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "schedules/search_schedules"
  resources :agency do
    resources :buses
    resources :routes
    resources :schedules do
      resources :reservations, except: :index
    end
  end

  get "reservations/index"

  resources :user do
    resources :user_profiles
  end
  
  
  
  get "agencies/dashboard"
  get "users/dashboard"

  devise_for :agencies 
  

  
  root "welcome#index"

  get "/user_profiles/subregion_options" => "user_profiles#subregion_options"
  
  #get "welcome/index"
  



  #delete "devise/sessions#destroy"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   

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
end
