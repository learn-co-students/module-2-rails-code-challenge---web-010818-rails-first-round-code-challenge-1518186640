Rails.application.routes.draw do
  resources :superpowers, only: [:show, :index]
  resources :superheroes, except: [:destroy, :delete, :edit, :update]

  get '/search', to: 'superheroes#search'
end
