Rails.application.routes.draw do
  post "/books",to: "books#create"
  namespace :api do
    namespace :v1 do
      get "/:username", to: "repositories#get_user"
      get "/:username/repos", to: "repositories#get_repository"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
