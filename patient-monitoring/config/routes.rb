Rails.application.routes.draw do
  devise_for :patients
  devise_for :doctors
  get "landing" => "pages#landing"
  resources :appointments
  
  authenticated :doctor do
    scope module: "doctors" do
      root :to => 'dashboards#index', as: "authenticated_doctor"
      resources :cases, except: [:new, :create] do
        
        resources :entries
      end
      get :my_cases, to: "cases#my_cases"

      resources :patients do
        resources :cases, only: [:new, :create]
      end
    end
  end

  authenticated :patient do 
    scope module: "patients" do
      root :to => 'cases#index', as: "authenticated_patient"
      resources :cases do
        resources :entries, only: [:index, :show]
      end
    end
  end

  unauthenticated do
    root :to => 'pages#landing'    
  end
  

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
end
