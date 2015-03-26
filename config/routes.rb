Rails.application.routes.draw do
  root 'users#new'

  resources :users
  resources :text_messages
  post '/success', to: 'text_messages#send_message', as: :text_success
end
