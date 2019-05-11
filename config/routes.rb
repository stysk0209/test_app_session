Rails.application.routes.draw do

  root to: 'carts#new'
  get '/test' => 'carts#test'
  get '/view' => 'carts#view'
  get '/create' => 'carts#create'
  get '/destroy' => 'carts#destroy'
  get '/db_destroy' => 'carts#db_destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
