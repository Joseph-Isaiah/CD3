class Condition < ApplicationRecord
  belongs_to :category
  has_many :calls

  def fields
    super.map do |name, type|
      Field.new(name, type)
    end
  end
end
