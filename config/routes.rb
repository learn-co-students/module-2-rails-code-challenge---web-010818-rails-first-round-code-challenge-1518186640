Rails.application.routes.draw do
  resources :superpowers, only: [:index, :show, :new, :create]
  resources :superheroes, only: [:index, :show, :new, :create]

end
