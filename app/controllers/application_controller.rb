class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if current_user.hospital
      dashboard_hospital_path(current_user.hospital)
    else
      new_call_path
    end
  end
end
