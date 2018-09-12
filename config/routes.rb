Rails.application.routes.draw do
  root "welcome#index"
  get '/validate_word', to: 'validation#index'

  namespace :api do
    namespace :v1 do
      get "/games", to: "games#show"
    end
  end
end
