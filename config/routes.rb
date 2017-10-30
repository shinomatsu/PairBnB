Rails.application.routes.draw do
  resources :bookings
  root "listings#index"
  # get 'listings/index'
  # get 'listings/show'
  # get 'listings/create'
  resources :users, only: [:show, :edit, :update]
  # resources :shinos, except: [:show]
  resources :listings do
    resources :booking
  end
  # , only: [:index, :show, :edit, :new, :create, :update, :destroy]
  resources :bookings, only:  [:destroy]


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

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post "/listings/:id/verify", to: "listings#verify", as: "verify"
  post "/listings/:id/bookings", to: "bookings#create", as:"reservation"

  root to: 'lisitngs#index'
  get 'search', to: 'listings#search'

end
