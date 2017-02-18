module Dev
  class PostsController < ::V1::PostsController

    protected

    def authenticate_user_from_token!
      authentication_token = params[:authentication_token]
      @author = Author.where(development_token: authentication_token).first
      sign_in @author if @author
    end

  end
end
