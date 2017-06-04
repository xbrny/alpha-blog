Rails.application.routes.draw do
  root "welcome#index"

  get "about", to: "welcome#about"
  resources :articles

  get "signup", to: "users#new"
  resources :users, except: [:new]

end
