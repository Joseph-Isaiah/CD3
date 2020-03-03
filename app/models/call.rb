class Call < ApplicationRecord
  belongs_to :user
  belongs_to :hospital
  belongs_to :condition
end
