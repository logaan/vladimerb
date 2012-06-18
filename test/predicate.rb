require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/predicate.rb"


class PredicateTest < Test::Unit::TestCase
  def tests_against_predicate_and_fails
    must_be_nil = Predicate.new(:name, :nil?, "Name must be nil.")
    candidate = Candidate.new("Jill", 24)
    errors = must_be_nil.validate(candidate)
    assert_equal(["Name must be nil."], errors)
  end

  def tests_against_predicate_and_succeeds
    must_be_nil = Predicate.new(:name, :nil?, "Name must be nil.")
    candidate = Candidate.new(nil, 24)
    errors = must_be_nil.validate(candidate)
    assert_equal([], errors)
  end
end
