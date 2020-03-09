class HospitalChannel < ApplicationCable::Channel
  def subscribed
    stream_from "hospital_#{params[:hospital_id]}_calls"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
