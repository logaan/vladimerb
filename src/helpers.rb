require File.dirname(File.expand_path(__FILE__)) + "/join.rb"
require File.dirname(File.expand_path(__FILE__)) + "/chain.rb"
require File.dirname(File.expand_path(__FILE__)) + "/required.rb"
require File.dirname(File.expand_path(__FILE__)) + "/greater_than.rb"
require File.dirname(File.expand_path(__FILE__)) + "/lambda.rb"
require File.dirname(File.expand_path(__FILE__)) + "/pattern.rb"
require File.dirname(File.expand_path(__FILE__)) + "/predicate.rb"

module Helpers
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
