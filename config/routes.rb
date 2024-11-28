Rails.application.routes.draw do
  root "pages#home"
  devise_for :users
  resources :users, only: [] do
    resources :events, only: [ :index ]
  end
  resources :events, only: [ :index, :show, :create, :new ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.htm
end
