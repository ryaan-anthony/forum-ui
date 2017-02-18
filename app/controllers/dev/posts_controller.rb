module Dev
  class PostsController < ::V1::PostsController

    def index
      operation_search
    end

    def create
      operation_create
    end

    def show
      operation_find
    end

    def update
      operation_update
    end

    def destroy
      operation_destroy
    end

    def current_author
      @author ||= Author.where(development_token: params[:authentication_token]).first
    end

  end
end
