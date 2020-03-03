class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def to_sym
    self.class.name.downcase.to_sym
  end

  def to_fk
    "#{self.class.name.downcase}_id".to_sym
  end

  def to_table_name
    ActiveSupport::Inflector.pluralize(self.class.name.downcase)
  end
end
