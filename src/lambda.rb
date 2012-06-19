class LambdaValidation
  def initialize &block
    @block = block
  end

  def validate record
    @block.call(record)
  end
end
