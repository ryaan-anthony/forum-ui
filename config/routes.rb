Rails.application.routes.draw do
  devise_for :authors
  get '/', to: 'page#index', as: 'frontpage'
  get 'g/:group', to: 'page#show', as: 'group'
end
