Rails.application.routes.draw do
  post 'location/create', controller: :location, action: :create

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
