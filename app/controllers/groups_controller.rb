class GroupsController < ApplicationController

  before_action :authenticate_author!, :except => [:new, :show, :index]

  def show
    @groups = Group.all
    group = Group.where(code: params[:id]).first
    @links = Link.where(group_id: group.id)
    render 'page/index'
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_url(@group.code), alert: "Group created successfully."
    else
      redirect_to new_group_path, alert: "Error creating user."
    end
  end

  private

  def group_params
    params.require(:group).permit(:title, :code, :author_id)
  end

end
