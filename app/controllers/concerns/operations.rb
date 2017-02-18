module Concerns::Operations
  extend ActiveSupport::Concern

  protected

  def operation_search
    render :json => {success: true}
  end

  def operation_create
    render :json => {success: true}
  end

  def operation_find
    render :json => {success: true}
  end

  def operation_update
    render :json => {success: true}
  end

  def operation_destroy
    render :json => {success: true}
  end

end
