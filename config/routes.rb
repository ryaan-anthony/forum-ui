Rails.application.routes.draw do
  apipie
  devise_for :authors
  get '/', to: 'page#index', as: 'homepage'

  scope :module => :v1, :path => '/api/v1' do
    resources :posts, except: [:new, :edit], constraints: lambda { |req| req.format == :json }
  end

  scope :module => :dev, :path => '/api/dev' do
    resources :posts, except: [:new, :edit], constraints: lambda { |req| req.format == :json }
  end

end
