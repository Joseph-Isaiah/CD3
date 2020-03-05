class Field
  attr_reader :name, :type, :values
  def initialize(name, data = {})
    @name = name
    @type = data["type"]
    @values = data["values"]
  end
end
