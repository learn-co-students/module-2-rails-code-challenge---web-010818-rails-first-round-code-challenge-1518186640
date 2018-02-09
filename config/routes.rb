Rails.application.routes.draw do
  resources :superpowers #, only: [:index]
  resources :superheroes #, only: [:index, :show, :edit, :create, :delete]

  post '/search', to: 'superpowers#search'

end
