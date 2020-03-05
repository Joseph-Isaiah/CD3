class Condition < ApplicationRecord
  belongs_to :category
  has_many :calls

  def fields
    super.map do |name, data|
      Field.new(name, data)
    end
  end
end
