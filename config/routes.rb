Rails.application.routes.draw do
  root to: 'visitors#index'
  
  devise_for :users, controllers: { registrations: "users/registrations", sessions: 'users/sessions', passwords: "users/passwords", confirmations: "users/confirmations" }
  resources :users

  resources :mailchimp do
    collection do 
      post :subscribe_to_mailchimp
  	end
  end
end
