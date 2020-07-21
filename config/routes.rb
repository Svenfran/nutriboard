Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :dashboard, only: %i[index]
  resources :meals, only: %i[index new create] do
    resources :foods, only: %i[new create]
  end
  resources :foods, only: %i[destroy]
end
