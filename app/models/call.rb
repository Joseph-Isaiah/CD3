class Call < ApplicationRecord
  VALID_GENDERS = ["Male", "Female"]

  belongs_to :user
  belongs_to :hospital
  belongs_to :condition

  def permitted_fields
    condition.fields.map(&:name).map(&:to_sym)
  end

  def details
    super.map do |name, value|
      Call::Detail.new(name, value)
    end
  end
end
