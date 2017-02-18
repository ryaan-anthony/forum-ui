Rails.application.routes.draw do
  apipie
  devise_for :authors
  get '/', to: 'page#index', as: 'homepage'

  def api_operations
    get '/post.json', to: 'posts#find'
    post '/post.json', to: 'posts#create'
    get '/posts.json', to: 'posts#search'
    put '/post.json', to: 'posts#update'
    delete '/post.json', to: 'posts#destroy'
  end

  scope :module => :v1, :path => '/api/v1' do
    api_operations
  end

  scope :module => :dev, :path => '/api/dev' do
    api_operations
  end

end
