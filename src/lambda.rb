require_relative "namespace"

class Vladimerb::LambdaValidation
  def initialize &block
    @block = block
  end

  def validate record
    @block.call(record)
  end
end
