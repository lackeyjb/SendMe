Rails.application.routes.draw do
  root 'sessions#new'

  resources :users, except: [:new]
  resources :sessions, only: [:create, :destroy]
  resources :text_messages
  post '/success', to: 'text_messages#send_message', as: :text_success
  get '/signin',        to: 'sessions#new'
  delete '/signout',    to: 'sessions#destroy'
  get '/signup',        to: 'users#new', as: :signup
end
