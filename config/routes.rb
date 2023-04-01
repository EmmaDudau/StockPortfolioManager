Rails.application.routes.draw do
  resources :stocks
  devise_for :profiles
  root 'home#index'
  get 'home/about'
 
    post "/" => 'home#index'

end
