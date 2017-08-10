Rails.application.routes.draw do

  get 'user_bookings/index'

  get 'bookings/index'

  get 'users/index'

  root 'flights#index'

  resources :flights do
    get "delete"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
