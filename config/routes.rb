Rails.application.routes.draw do
  root "users#home"
  get "/signup", to: "users#new"
  resources :users
end
