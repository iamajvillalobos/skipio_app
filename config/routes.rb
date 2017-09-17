Rails.application.routes.draw do
  root to: 'contacts#index'
  resources :contacts, only: [:index]
  resource :messages, only: [:new, :create, :show]
end
