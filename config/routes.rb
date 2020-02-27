Rails.application.routes.draw do
  # declare gem
  devise_for :users

  # declare resource
  resources :posts

  # declare path
  root to: "posts#index"

  # get "/new" => "posts#new"

  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end

end
