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
  resources :favorites, only: [:create, :destroy, :index]
  
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
end
