class Call::EmergenciesController < ApplicationController
  def create
    @call = Call.new
    @call.critical  = true
    @call.hospital  = Hospital.find(params[:hospital_id])
    @call.condition = Condition.find(params[:condition_id])
    @call.user      = current_user

    @call.save!

    Call::Broadcaster.new(@call).call

    redirect_to new_call_path, notice: "Info sent"
  end
end
