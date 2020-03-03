class Condition < ApplicationRecord
  belongs_to :category
  has_many :calls
end
