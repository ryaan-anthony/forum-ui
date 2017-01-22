class PageController < ApplicationController

  before_action :authenticate_author!, :only => [:new]

  def index
    respond_to do |format|
      format.html {
        render :index
      }
      format.json {
        link_count = params[:link_count].to_i || 0
        links = Link.search query: {
          bool: {
            # make a query
             should: { term: { title: 'snow' } }
            # get newest links
            #filter: { range: { created_at: { gt: params[:last_date] || 0 } } }
          }
        }#, sort: [ { created_at: { order: 'asc' } } ]
        render json: { links: links.from(link_count), link_count: link_count }
      }
    end
  end

  def new
    link = Link.new(link_params)
    link.author_id = current_author.id
    if link.save
      redirect_to :back, notice: "Link created successfully."
    else
      redirect_to :back, alert: "Error creating link."
    end
  rescue Errors::InvalidLinkError
    redirect_to :back, alert: "Sorry, invalid link."
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end

end
