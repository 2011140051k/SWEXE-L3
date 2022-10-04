Rails.application.routes.draw do
  resources :tweets
  root 'tweets#index'
  get 'get_image/:id', to: 'images#get_image'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
