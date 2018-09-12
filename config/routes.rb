Rails.application.routes.draw do
  root "welcome#index"
  get '/validate_word', to: 'validation#index'
end
