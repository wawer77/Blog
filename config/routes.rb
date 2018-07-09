Rails.application.routes.draw do
  root  'home#home'
  get 'landing', to: 'home#home'

  resources :articles do
    resources :comments
  end
end
