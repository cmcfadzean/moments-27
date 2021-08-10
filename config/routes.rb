Rails.application.routes.draw do
  resources :moments
  devise_for :users
  root 'moments#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
