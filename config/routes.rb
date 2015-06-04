# == Route Map
#
#          Prefix Verb   URI Pattern                     Controller#Action
#            root GET    /                               pages#home
#           login GET    /login(.:format)                sessions#new
#                 POST   /login(.:format)                sessions#create
#          logout GET    /logout(.:format)               sessions#destroy
#          signup GET    /signup(.:format)               users#new
#           users POST   /users(.:format)                users#create
#      users_edit GET    /users/edit(.:format)           users#edit
#                 PATCH  /users(.:format)                users#update
#            user GET    /user(.:format)                 users#show
# user_properties GET    /user/properties(.:format)      users#properties
#    user_rentals GET    /user/rentals(.:format)         users#rentals
#   user_bookings GET    /user/bookings(.:format)        users#bookings
#      properties GET    /properties(.:format)           properties#index
#                 POST   /properties(.:format)           properties#create
#    new_property GET    /properties/new(.:format)       properties#new
#   edit_property GET    /properties/:id/edit(.:format)  properties#edit
#        property GET    /properties/:id(.:format)       properties#show
#                 PATCH  /properties/:id(.:format)       properties#update
#                 PUT    /properties/:id(.:format)       properties#update
#                 DELETE /properties/:id(.:format)       properties#destroy
#        bookings POST   /bookings(.:format)             bookings#create
#         booking GET    /bookings/:id(.:format)         bookings#show
#  accept_booking PATCH  /bookings/accept/:id(.:format)  bookings#accept
# decline_booking PATCH  /bookings/decline/:id(.:format) bookings#decline
#  cancel_booking PATCH  /bookings/cancel/:id(.:format)  bookings#cancel
#

Rails.application.routes.draw do

  root :to => 'pages#home'
 
  get   '/login'  => 'sessions#new'
  post  '/login'  => 'sessions#create'
  get   '/logout' => 'sessions#destroy'


  get   '/signup'         => 'users#new'
  post  '/users'          => 'users#create'
  get   'users/edit'      => 'users#edit'
  patch '/users'          => 'users#update'
  get   '/user'           => 'users#show'
  get   'user/properties' => 'users#properties'
  get   'user/rentals'    => 'users#rentals'
  get   'user/bookings'   => 'users#bookings'


  resources :properties
    

  #resources :bookings
  post  '/bookings'             =>  'bookings#create'
  get   '/bookings/:id'         =>  'bookings#show',    :as => 'booking'
  patch '/bookings/accept/:id'  =>  'bookings#accept',  :as => 'accept_booking'
  patch '/bookings/decline/:id' =>  'bookings#decline', :as => 'decline_booking'
  patch '/bookings/cancel/:id'  =>  'bookings#cancel',  :as => 'cancel_booking'

end
