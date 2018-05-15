Rails.application.routes.draw do
  get 'sessions/new'

  resources :tweets do
    collection do
      post :confirm
    end
  end  
  root :to =>"tweets#index"
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
end
