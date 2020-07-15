Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :items, except: [:new, :edit]
      resources :merchants, only: [:index]
    end
  end
end