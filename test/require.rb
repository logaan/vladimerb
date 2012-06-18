require "rubygems"

gem "test-unit", "2.5.0"

require "test/unit"
require File.join(File.dirname(File.expand_path(__FILE__)), "../src/require.rb")

class Candidate
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

class RequiredTest < Test::Unit::TestCase
  def test_succeeds_for_candidate_with_name
    validation = Required.new(:name)
    candidate = Candidate.new("Fred", 50)
    errors = validation.validate(candidate)
    assert_equal([], errors)
  end

  def test_fails_for_candidate_without_name
    validation = Required.new(:name)
    candidate = Candidate.new(nil, 24)
    errors = validation.validate(candidate)
    assert_equal(["name is required."], errors)
  end

  def test_fails_for_candidate_with_blank_name
    validation = Required.new(:name)
    candidate = Candidate.new("", 24)
    errors = validation.validate(candidate)
    assert_equal(["name is required."], errors)
  end

  def test_fails_for_candidate_without_age
    validation = Required.new(:age)
    candidate = Candidate.new("Bob", nil)
    errors = validation.validate(candidate)
    assert_equal(["age is required."], errors)
  end
end

