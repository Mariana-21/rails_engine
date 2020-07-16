Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      namespace :merchants do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
      end
      resources :merchants, except: [:new, :edit] do 
        get 'items', to: 'merchants/items#index'
      end
      namespace :items do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
      end
      resources :items, except: [:new, :edit] do
        get 'merchant', to: 'items/merchant#show'
      end
    end
  end
end