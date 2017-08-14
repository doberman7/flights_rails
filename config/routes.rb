Rails.application.routes.draw do
  #resources :flights

  post "/" => 'flights#show' , as: 'forma'
  post "/user/select_fly", to: 'flights#select_fly' , as: 'select_fly'
  root 'flights#index'
  post "/user/new", to: 'flights#user_new' , as: 'user_new'
  get "/user/add", to: 'flights#user_add' , as: 'user_add'

  post "/passengers", to: 'flights#passengers', as: 'passengers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
