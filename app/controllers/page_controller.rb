class PageController < ApplicationController

  def index
    @groups = Group.all
    @links = Link.last(5)
  end

  def show
    @groups = Group.all
    group = Group.where(code: params[:group]).first
    @links = Link.where(group_id: group.id)
    render :index
  end

end
