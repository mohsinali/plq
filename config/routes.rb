Rails.application.routes.draw do
  root to: 'visitors#index'
  
  devise_for :users, controllers: { registrations: "users/registrations", sessions: 'users/sessions', passwords: "users/passwords", confirmations: "users/confirmations" }
  resources :agents
  resources :vendors
  resources :admin

  resources :mailchimp do
    collection do 
      post :subscribe_to_mailchimp
  	end
  end

  resources :users do
  	collection do
  		post :request_for_membership
  	end
  end

  resources :visitors do
    collection do
      get :service_content
    end
  end

  # Static Pages
  get '/about', to: 'pages#about_us'
  get '/contact', to: 'pages#contact_us'
  get '/help', to: 'pages#help_center'
  get '/app', to: 'pages#app'
  get '/platform', to: 'pages#platform'
  get '/plq-provider-network', to: 'pages#plq_provider_network'
end
