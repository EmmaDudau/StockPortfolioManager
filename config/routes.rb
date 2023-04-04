Rails.application.routes.draw do
# devise_for :controllers
  resources :stocks
  devise_for :profiles, controllers: {
    registrations: 'profiles/registrations'
        }
  root 'home#index'
  get 'home/about'
 
    post "/" => 'home#index'

end
