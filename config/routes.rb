Byswap::Application.routes.draw do
  root :to => "static#home"
  resources :users, :only => [:index, :show, :edit, :update ]
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :new_user_session
  delete '/signout' => 'sessions#destroy', :as => :destroy_user_session
  get '/auth/failure' => 'sessions#failure'
end
