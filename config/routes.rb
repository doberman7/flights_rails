Rails.application.routes.draw do
  post "/" => 'flights#show' , as: 'forma'
  post "/user/select_fly", to: 'flights#select_fly' , as: 'select_fly', via: [:get, :post]
  root 'flights#index'
  post "/user/new", to: 'flights#user_new' , as: 'users'
  post "/user/add", to: 'flights#user_add' , as: 'user_add'
  post "/pay", to: 'flights#pay' , as: 'pay'

  # post "/user_admin", to: 'flights#user_admin' , as: "user_admin"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
