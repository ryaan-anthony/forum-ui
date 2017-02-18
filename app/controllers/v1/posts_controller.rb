module V1
  class PostsController < ApplicationController
    include Concerns::Operations

    before_filter :authenticate_author_from_token!
    before_action :authenticate_author!

    resource_description do
      param :authentication_token, String, :required => true, :desc => I18n.t('api.params.authentication_token')
    end

    api :GET, '/v1/search.json', I18n.t('api.index.description')
    description I18n.t('api.index.detailed_description')
    def index
      operation_search
    end

    api :POST, '/v1/create.json', I18n.t('api.create.description')
    description I18n.t('api.create.detailed_description')
    def create
      operation_create
    end

    api :GET, '/v1/find.json', I18n.t('api.show.description')
    description I18n.t('api.show.detailed_description')
    def show
      operation_find
    end

    api :PUT, '/v1/update.json', I18n.t('api.update.description')
    description I18n.t('api.update.detailed_description')
    def update
      operation_update
    end

    api :DELETE, '/v1/destroy.json', I18n.t('api.destroy.description')
    description I18n.t('api.destroy.detailed_description')
    def destroy
      operation_destroy
    end

    protected

    def render *args
      deauthenticate_author!
      super
    end

    def deauthenticate_author!
      sign_out @author
    end

    def authenticate_author_from_token!
      @author = current_author
      sign_in @author if @author
    end

    def current_author
      Author.where(authentication_token: params[:authentication_token]).first
    end

  end

end
