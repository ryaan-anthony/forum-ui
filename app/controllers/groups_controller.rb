class GroupsController < ApplicationController

  include GroupHelper

  before_action :authenticate_author!, :except => [:new, :show, :index]
  before_filter :require_permission, :only => [:edit, :update]

  def show
    respond_to do |format|
      format.html {
        @groups = Group.all
        render :index
      }
      format.json {
        @links = Link.search query: {
            bool: {
              # belongs to group
              must: { term: { group_id: current_group.id } },
              # get newest links
              filter: { range: { created_at: { gt: params[:last_date] || 0 } } }
            }
          }, sort: [ { created_at: { order: 'asc' } } ]
        render json: { links: @links, template: params[:last_date] }
      }
    end
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def update
    @group = Group.update(current_group.id, group_params)
    if @group.save
      redirect_to edit_group_path(@group.code), alert: "Group updated successfully."
    else
      redirect_to edit_group_path(@group.code), alert: "Error updating group."
    end
  end

  def create
    @group = Group.new(group_params)
    @group.author = current_author
    if @group.save
      redirect_to group_url(@group.code), alert: "Group created successfully."
    else
      redirect_to new_group_path, alert: @group.errors.full_messages #"Error creating group."
    end
  end

  helper_method :page_title
  def page_title
    "#{current_group.title} | #{t('page.title')}"
  end

  private

  def require_permission
    redirect_to group_url(current_group.code) unless can_edit_group
  end

  def group_params
    params.require(:group).permit(:title)
  end

end
