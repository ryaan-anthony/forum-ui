Rails.application.routes.draw do
  devise_for :authors
  get '/(.:format)', to: 'page#index', as: 'homepage'
  authenticate :author do
    resources :groups, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :groups do
    resources :links
  end
end
