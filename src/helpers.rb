require File.dirname(File.expand_path(__FILE__)) + "/join.rb"
require File.dirname(File.expand_path(__FILE__)) + "/required.rb"

module Helpers
  def join validation_1, validation_2
    Join.new validation_1,validation_2
  end

  def required field_name
    Required.new field_name
  end
end
