Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
end
