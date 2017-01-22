class PageController < ApplicationController

  def index
    respond_to do |format|
      format.html {
        render :index
      }
      format.json {
        @links = Link.search query: {
          bool: {
            # get newest links
            filter: { range: { created_at: { gt: params[:last_date] || 0 } } }
          }
        }, sort: [ { created_at: { order: 'asc' } } ]
        render json: { links: @links, template: params[:last_date] }
      }
    end
  end

end
