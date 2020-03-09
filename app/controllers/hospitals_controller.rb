class HospitalsController < ApplicationController
  def dashboard
    @hospital = Hospital.find(params[:id])

  end

  def latest_call
    @latest_call = @hospital.calls.last
  end

end
