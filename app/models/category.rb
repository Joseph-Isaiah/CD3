class Category < ApplicationRecord
  has_many :conditions

  def slug
    name.parameterize
  end
end
