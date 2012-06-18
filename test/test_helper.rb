require "rubygems"
gem "test-unit", "2.5.0"
require "test/unit"

class Candidate
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end
