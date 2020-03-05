class HospitalsController < ApplicationController
  def dashboard
    @hospital = Hospital.find(params[:id])
  end
end
