class HospitalsController < ApplicationController
  def dashboard
    @hospital = Hospital.find(params[:id])
    @latest_call = @hospital.calls.last
  end
end
