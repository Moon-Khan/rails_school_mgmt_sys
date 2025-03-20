class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # allow_browser versions: :modern


  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path
    elsif resource.teacher?
      index_teachers_path
    else
      index_students_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # Redirect to login page
  end

end
