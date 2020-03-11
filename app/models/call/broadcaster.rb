class Call::Broadcaster
  def initialize(call)
    @helpers = ActionController::Base.new
    @call = call
  end

  def call
    ActionCable.server.broadcast(
      "hospital_#{@call.hospital.id}_calls",
      {
        id: @call.id,
        card: @helpers.render_to_string(partial: "hospitals/call_card", locals: { call: @call }),
        content: @helpers.render_to_string(partial: "calls/show", locals: { call: @call }),
      }
    )
  end
end
