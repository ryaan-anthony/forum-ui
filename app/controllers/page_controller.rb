class PageController < ApplicationController

  def index
    @groups = Group.all
    @links = Link.last(5)
  end

end
