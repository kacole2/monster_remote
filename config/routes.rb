Monster::Application.routes.draw do
  resources :comsettings

  resources :rasberry_pis

  match '/', to: 'static_pages#home', via: 'get', as: :home
  match '/help', to: 'static_pages#help', via: 'get', as: :help
  match '/contact', to: 'static_pages#contact', via: 'get', as: :contact
  match '/about', to: 'static_pages#about', via: 'get', as: :about
  match '/changecomsettings', to: 'static_pages#changecomsettings', via: 'get', as: :changecomsettings
  resources :scenes
  post 'rasberry_pis/shutdown' => 'rasberry_pis#shutdown', as: :shutdown_pi
  post 'scenes/:id/invoke' => 'scenes#invokescene', as: :invoke
  post 'scenes/stop_animation' => 'scenes#stop_animation', as: :stop_animation
  post 'scenes/stop_ambient' => 'scenes#stop_ambient', as: :stop_ambient
  post 'scenes/start_ambient' => 'scenes#start_ambient', as: :start_ambient
  post 'scenes/sequential_mode' => 'scenes#sequential_mode', as: :sequential_mode
  post 'scenes/single_mode' => 'scenes#single_mode', as: :single_mode
  post 'scenes/random_mode' => 'scenes#random_mode', as: :random_mode
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

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
