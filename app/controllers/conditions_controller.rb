class ConditionsController < ApplicationController
  def fields
    @condition = Condition.find(params[:id])
    puts @condition.fields.inspect
  end
end
