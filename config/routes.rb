Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users do
  resource :profile
  end

  resources :users, only: [:tab] do
   member do
    get 'tab'
    end
    end
   
   
 

  resources :users, only: [:index]
    
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :restore
    end
  end   

  resources :conversations, only: [:index, :show, :destroy] do
    collection do
      delete :empty_trash
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
     post :mark_as_read
    end
  end  
  
  resources :messages, only: [:new, :create] 

  resources :posts do
    resources :comments 
  end
  resources :tags, only: [:index, :show] 
  #get 'tags/:tag', to: 'posts#index', as: "tag" ## It should go to index action not show
  resources :papers
  resources :cleanings
  resources :electros
  resources :hwaters
  resources :transports
  resources :garbages
  resources :friendships
  resources :addons
  root 'pages#index'

  

 
  get 'about' => 'pages#about'
  get 'gb' => 'pages#gb_index'
 
  get 'compare_friends', to: 'users#compare' 
  get 'add_friend', to: 'users#add_friend'


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
