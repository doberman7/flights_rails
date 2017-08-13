Rails.application.routes.draw do
  #resources :flights

  post "/" => 'flights#show' , as: 'forma'
  post "/user/select_fly", to: 'flights#select_fly' , as: 'select_fly'
  root 'flights#index'
  post "/user/new", to: 'flights#user_new' , as: 'users'
  post "/passengers", to: 'flights#passengers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
