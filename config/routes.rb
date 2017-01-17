Rails.application.routes.draw do
  devise_for :authors
  get '/', to: 'page#index', as: 'frontpage'
  authenticate :author do
    resources :groups, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :groups do
    resources :links
  end
end
