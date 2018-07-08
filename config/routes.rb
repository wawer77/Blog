Rails.application.routes.draw do
  root  'home#home'
  get 'landing', to: 'home#home'

  resources :articles
end
