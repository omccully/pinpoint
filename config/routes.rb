Rails.application.routes.draw do

  post 'location/create', controller: :location, action: :create
  get 'location', controller: :location, action: :index
  get 'location/json', controller: :location, action: :json


  get '/', to: redirect('/location')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
