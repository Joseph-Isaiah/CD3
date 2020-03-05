class Call < ApplicationRecord
  VALID_GENDERS = ["male", "female"]

  belongs_to :user
  belongs_to :hospital
  belongs_to :condition

  validates :gender, :age, :blood_pressure, :pulse, :temperature, :spa02, :user, :hospital, :condition, presence: true
  validates :gender, inclusion: { in: VALID_GENDERS }

  def permitted_fields
    condition.fields.map(&:name).map(&:to_sym)
  end
end
