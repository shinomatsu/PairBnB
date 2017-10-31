Rails.application.routes.draw do
  
  root "listings#index"

#------clearance

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#----clearance



  resources :listings

  resources :users, only: [:show, :edit, :update]
  # resources :shinos, except: [:show]
  resources :listings do
    resources :bookings, only: [:index, :new, :create]
  end
  # , only: [:index, :show, :edit, :new, :create, :update, :destroy]
  resources :bookings, only:  [:show, :edit, :update, :destroy]



  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  
  post "/listings/:id/verify", to: "listings#verify", as: "verify"
  


  get 'search', to: 'listings#search'

  post '/bookings/:id/braintree/checkout', to: "braintree#checkout", as: "braintree_checkout"

  get '/bookings/:id/braintree/new', to: "braintree#new", as: "braintree_new"

end
