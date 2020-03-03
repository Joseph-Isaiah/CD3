class Call < ApplicationRecord
  VALID_GENDERS = ["male", "female"]

  belongs_to :user
  belongs_to :hospital
  belongs_to :condition

  validates :gender, inclusion: { in: VALID_GENDERS }
end
