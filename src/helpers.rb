require File.dirname(File.expand_path(__FILE__)) + "/join.rb"
require File.dirname(File.expand_path(__FILE__)) + "/chain.rb"
require File.dirname(File.expand_path(__FILE__)) + "/required.rb"
require File.dirname(File.expand_path(__FILE__)) + "/greater_than.rb"

module Helpers
  def join validation_1, validation_2
    Join.new validation_1,validation_2
  end

  def chain validation_1, validation_2
    Chain.new validation_1,validation_2
  end

  def required field_name
    Required.new field_name
  end

  def greater_than field_name, minimum
    GreaterThan.new field_name, minimum
  end
end
