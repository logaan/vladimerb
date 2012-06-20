require "rubygems"
gem "test-unit", "2.5.0"
require "test/unit"
require_relative "../src/vladimerb"

class Candidate
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

def assert_errors(data, validation, expected_errors)
  actual_errors = validation.validate(data)
  assert_equal(expected_errors, actual_errors)
end

