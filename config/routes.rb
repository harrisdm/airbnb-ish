# == Route Map
#
#     Prefix Verb  URI Pattern           Controller#Action
#       root GET   /                     pages#home
#     signup GET   /signup(.:format)     users#new
#      users POST  /users(.:format)      users#create
# users_edit GET   /users/edit(.:format) users#edit
#            PATCH /users(.:format)      users#update
#      login GET   /login(.:format)      sessions#new
#            POST  /login(.:format)      sessions#create
#     logout GET   /logout(.:format)     sessions#destroy
#

Rails.application.routes.draw do

  root :to => 'pages#home'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get 'users/edit' => 'users#edit'
  patch '/users' => 'users#update'
  get '/user' => 'users#show'
 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :properties
  
end
