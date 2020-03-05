class CallsController < ApplicationController
  def new
    @call = Call.new
    @hospitals = Hospital.all
  end

  def create
    @call = Call.new(call_params)
    @call.details = details_params
    raise
    @call.user = current_user

    if @call.save
      flash[:notice] = "Info sent"
    else
      render new_call_path
    end
  end

  private

  def call_params
    params
      .require(:call)
      .permit(:gender, :age, :blood_pressure, :pulse, :temperature, :spa02, :condition_id, :hospital_id)
  end

  def details_params
    params.require(:call).require(:details).permit(@call.permitted_fields)
  end
end
