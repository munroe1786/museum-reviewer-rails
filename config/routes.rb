Rails.application.routes.draw do
  devise_for :users
  resources :reviews
  resources :museums do
    resources :reviews
  end
  root 'museums#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
