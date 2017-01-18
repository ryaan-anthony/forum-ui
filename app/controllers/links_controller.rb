class LinksController < ApplicationController

  include GroupHelper

  def show
    # todo count
    redirect_to current_link.url
  end

  def create
    @link = Link.new(link_params)
    @link.group = current_group
    @link.author = current_author if current_author.present?
    if @link.save
      redirect_to group_url(current_group.code), alert: "Link created successfully."
    else
      redirect_to new_group_link_path, alert: "Error creating link."
    end
  rescue Errors::InvalidLinkError
    redirect_to :back, alert: "Sorry, invalid link."
  end

  def current_link
    @current_link ||= Link.find(params[:id])
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end

end
