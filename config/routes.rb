Rails.application.routes.draw do
  resources :superpowers
  resources :superheroes
  # get '/search', to: 'superheroes#search'
end
