Rails.application.routes.draw do
  resources :contacts, only: [:index]
  resource :messages, only: [:new, :create, :show]
end
