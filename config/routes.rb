Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :blurbs, only: [:index, :show, :create, :destroy]
  post '/blurb/:id/comments', to: 'comments#create'

end
