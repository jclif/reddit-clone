Reddit::Application.routes.draw do
  root to: "static_pages#home"

  resources :users, only: [:new, :create, :show]

  resource :session, only: [:new, :create, :destroy]

  resources :subs, only: [:index, :show, :new, :create]
end
