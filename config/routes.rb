Rails.application.routes.draw do
  
  get 'admins/index'

  root "tops#index"
  
  devise_for :users, :controllers =>{
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  
  resources :faculties
  resources :events
  resources :informations
  resources :photos
  resources :users
  resources :admins
  
end
