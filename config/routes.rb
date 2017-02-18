Rails.application.routes.draw do
  apipie
  devise_for :authors
  get '/', to: 'page#index', as: 'homepage'

  def api_operations
    get '/search.json', to: 'posts#index'
    post '/create.json', to: 'posts#create'
    get '/find.json', to: 'posts#show'
    put '/update.json', to: 'posts#update'
    delete '/destroy.json', to: 'posts#destroy'
  end

  scope :module => :v1, :path => '/api/v1' do
    api_operations
  end

  scope :module => :dev, :path => '/api/dev' do
    api_operations
  end

end
