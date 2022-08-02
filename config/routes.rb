Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
  get "free_event", to:"pages#free_event"
  get "today_event", to:"pages#today_event"
  get "volunteer_event", to:"pages#volunteer_event"
  get "health_event", to:"pages#health_event"
  get "course_event", to:"pages#course_event"
  get "theatre_event", to:"pages#theatre_event"
  get "dance_event", to:"pages#dance_event"
  get "workshop_event", to:"pages#workshop_event"
  get "cart", to: "pages#cart"

  devise_for :users
  get "profile", to:"users#profile"
  
  resources :events
  post "checkout/create", to: "checkout#create", as: "checkout_create"

  get "success", to: "checkout#success"
  get "cancel", to: "checkout#cancel"

  post "events/add_to_cart/:id", to: "events#add_to_cart", as: "add_to_cart"
  delete "events/remove_from_cart/:id", to: "events#remove_from_cart", as: "remove_from_cart"
end
