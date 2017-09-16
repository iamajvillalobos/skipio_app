Rails.application.routes.draw do
  resources :contacts, only: [:index]
  resources :messages, only: [:new, :create]
end
