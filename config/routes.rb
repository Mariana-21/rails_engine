Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :items, except: [:new, :edit]
      resources :merchants, except: [:new, :edit] do 
        get 'items', to: 'merchants/items#index'
      end
    end
  end
end