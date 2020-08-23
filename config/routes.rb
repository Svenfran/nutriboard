Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get :autocomplete, to: 'foods#autocomplete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :dashboard, only: %i[index]
  resources :meals, only: %i[index new create edit update destroy] do
    resources :foods, only: %i[new create edit update]
  end
  resources :foods, only: %i[destroy]

  namespace :charts do
    get "meal-calories"
    get "total-calories"
    get "total-nutrients"
  end
end
