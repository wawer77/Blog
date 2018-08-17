Rails.application.routes.draw do
  devise_for :users
  root  'home#home'
  get 'landing', to: 'home#home'

  resources :articles do
    resources :comments
  end
end
