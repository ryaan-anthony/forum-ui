module Dev
  class PostsController < ::V1::PostsController

    resource_description do
      param :authentication_token, String, :required => true, :desc => I18n.t('api.params.authentication_token')
      api_version 'dev'
    end

    def current_author
      @author ||= Author.where(development_token: params[:authentication_token]).first
    end

  end
end
