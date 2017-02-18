class SessionsController < Devise::SessionsController

  # Redirect back to homepage
  def auth_options
    { scope: resource_name, recall: 'dashboard#index' }
  end


end
