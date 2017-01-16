Rails.application.routes.draw do
  get '/', to: 'frontpage#index', as: 'frontpage'
end
