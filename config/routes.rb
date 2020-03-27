Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :blurbs, only: [:index, :show, :create, :destroy]
  post '/blurb/:id/comments', to: 'comments#create'

  post 'authenticate', to: 'authentication#authenticate'

end
