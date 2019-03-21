Rails.application.routes.draw do
  get 'messages/new'
  get 'messages/create'
  get 'messages/index'
  get 'messages/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about', to: 'pages#about', as: :about
  get 'contact', to: 'pages#contact', as: :contact
  get 'dogs/me', to: 'dogs#me', as: :me

  resources :dogs do
    resources :mydogs, only: [:create, :destroy]
  end

  resources :mydogs, only: [:index]

  resources :messages, only: [:new, :create, :index, :destroy]

end
