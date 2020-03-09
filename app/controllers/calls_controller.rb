class CallsController < ApplicationController
  def new
    @call = Call.new
    @hospitals = Hospital.all
  end

  def create
    @call = Call.new(call_params)
    @call.details = details_params
    @call.user = current_user

    if @call.save
      ActionCable.server.broadcast(
        "hospital_#{@call.hospital.id}_calls",
        {
          card: render_to_string(partial: "hospitals/call_card", locals: { call: @call }),
          content: render_to_string(partial: "calls/show", locals: { call: @call }),
        }
      )
      flash[:notice] = "Info sent"
      redirect_to new_call_path
    else
      binding.pry
      render :new
    end
  end

  private

  def call_params
    params
      .require(:call)
      .permit(:gender, :age, :blood_pressure, :pulse, :temperature, :spa02, :condition_id, :hospital_id)
  end

  def details_params
    #fix me
    params.require(:call).require(:details).permit(
      @call.permitted_fields,
      radiating_to: [],
      chest_pain_meds: [],
      chest_pain_quality: [],
      chest_pain_relieved_by: [],
      chest_pain_worsened_by: [],
      chest_pain_past_history: [],
      chest_pain_associated_symptoms: [],
      burn_meds: [],
      burn_context: [],
      burn_facial: [],
      burn_location: [],
      burn_meds: []
      )
  end
end
