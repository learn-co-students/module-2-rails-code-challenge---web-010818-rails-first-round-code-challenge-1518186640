Rails.application.routes.draw do
  resources :superpowers
  resources :superheroes

  get '/search', to: 'superpowers#search', as: 'search'

end
