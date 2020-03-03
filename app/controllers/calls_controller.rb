class CallsController < ApplicationController
  def new
    @call = Call.new
    @hospitals = Hospital.all
  end

  def create
    raise
  end
end
