Rails.application.routes.draw do
  root "welcome#index"
  get "about", to: "welcome#about"
  resources :articles
end
