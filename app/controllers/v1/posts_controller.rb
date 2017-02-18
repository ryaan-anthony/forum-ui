module V1
  class PostsController < ApplicationController

    before_filter :authenticate_user_from_token!
    before_action :authenticate_author!

    resource_description do
      param :authentication_token, String, :required => true, :desc => I18n.t('api.params.authentication_token')
    end

    api :GET, '/v1/posts.json', I18n.t('api.index.description')
    def index
      render :json => {success: true}
    end

    api :POST, '/v1/posts.json', I18n.t('api.create.description')
    def create
      render :json => {success: true}
    end

    api :GET, '/v1/posts/:id.json', I18n.t('api.show.description')
    def show
      render :json => {success: true}
    end

    api :PATCH, '/v1/posts/:id.json', I18n.t('api.partial_update.description')
    def partial_update
      render :json => {success: true}
    end

    api :PUT, '/v1/posts/:id.json', I18n.t('api.update.description')
    def update
      return partial_update if request.patch?
      render :json => {success: true}
    end

    api :DELETE, '/v1/posts/:id.json', I18n.t('api.destroy.description')
    def destroy
      render :json => {success: true}
    end

    protected

    def render *args
      deauthenticate_author!
      super
    end

    def deauthenticate_author!
      sign_out @author
    end

    def authenticate_user_from_token!
      authentication_token = params[:authentication_token]
      @author = Author.where(authentication_token: authentication_token).first
      sign_in @author if @author
    end

  end

end
