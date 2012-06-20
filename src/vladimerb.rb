require_relative "join"
require_relative "chain"
require_relative "required"
require_relative "greater_than"
require_relative "lambda"
require_relative "pattern"
require_relative "predicate"

module Vladimerb
  def join *validations
    validations.reduce{ |tree, validation|
      Join.new tree, validation }
  end

  def chain *validations
    validations.reduce{ |tree, validation|
      Chain.new tree, validation }
  end

  def required field_name
    Required.new field_name
  end

  def greater_than field_name, minimum
    GreaterThan.new field_name, minimum
  end

  def lambda_validation &block
    LambdaValidation.new &block
  end

  def pattern field_name, regex
    Pattern.new field_name, regex
  end

  def predicate field_name, method, msg
    Predicate.new field_name, method, msg
  end
end

include Vladimerb

