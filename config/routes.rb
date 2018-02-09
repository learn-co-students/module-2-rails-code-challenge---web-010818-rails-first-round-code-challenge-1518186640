Rails.application.routes.draw do
  resources :superpowers, only: [:index,:show]
  resources :superheroes, only: [:index, :show, :new, :create]
  get "/search", to: "superheroes#search", as: "search"
  post "/search", to: "superheroes#search"

end
