class SessionsController < Devise::SessionsController

  def create
    super
    flash[:notice] = "Привет, #{current_user.first_name}" unless current_user.admin?
  end
end
