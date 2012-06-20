require_relative "namespace"

class Vladimerb::Chain
  def initialize validation_1, validation_2
    @validation_1 = validation_1
    @validation_2 = validation_2
  end

  def validate record
    error_1 = @validation_1.validate(record)
    error_1.empty? ? @validation_2.validate(record) : error_1
  end
end
