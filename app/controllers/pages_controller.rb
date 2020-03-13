class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :kitchen_sink]

  def home
  end

  def dashboard
    if current_user.paramedic?
      redirect_to new_call_path
    else
      redirect_to dashboard_hospital_path(current_user.hospital)
    end
  end

  def kitchen_sink
    @call = Call.new
  end
end
