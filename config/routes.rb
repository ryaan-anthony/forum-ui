Rails.application.routes.draw do
  devise_for :authors
  get '/(.:format)', to: 'page#index', as: 'homepage'
  post '/submit', to: 'page#new', as: 'submit'
end
