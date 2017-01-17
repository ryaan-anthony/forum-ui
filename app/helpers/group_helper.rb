module GroupHelper
  def current_group
    @current_group ||= Group.where("BINARY code = ?", params[:group_id] || params[:id]).first
    raise ActionController::RoutingError.new('Not Found') unless @current_group
    @current_group
  end
  def can_edit_group
    current_author.present? && current_group.author == current_author
  end
end
