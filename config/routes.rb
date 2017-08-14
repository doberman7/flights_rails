Rails.application.routes.draw do
  #resources :flights

  post "/" => 'flights#show' , as: 'forma'
  post "/user/select_fly", to: 'flights#select_fly' , as: 'select_fly'
  root 'flights#index'
  get "/user/new", to: 'flights#user_new' , as: 'user_new'
  post "/passengers", to: 'flights#passengers', as: 'passengers'
  get "/user/save", to: 'flights#user_save' , as: 'user_save'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
