Rails.application.routes.draw do
  #resources :flights

  post "/" => 'flights#show' , as: 'forma'
  post "/user/create", to: 'flights#user_create' , as: 'user_create'
  root 'flights#index'
  post "/user/new", to: 'flights#user_new' , as: 'users'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
