Rails.application.routes.draw do
  #resources :flights

  post "/" => 'flights#show' , as: 'forma'
  post "/user/create", to: 'flights#create_user' , as: 'user_create' 
  root 'flights#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
