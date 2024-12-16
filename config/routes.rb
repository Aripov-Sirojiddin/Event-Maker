Rails.application.routes.draw do
  root "pages#home"

  get "attendees/new"
  get "attendees/create"

  get "attending_events", to: "users#attending_events"

  get "invited_events", to: "users#invited_events"

  patch "update_invite_status", to: "invitiations#update_invite_status"

  devise_for :users

  resources :users, only: [] do
    resources :events, only: [ :index, :edit, :update, :destroy ]
  end
  resources :events do
    resources :attendees, only: [ :new, :create, :destroy ]
    resources :invitiations, only: [ :new, :create, :destroy ]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.htm
end
