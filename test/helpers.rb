require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/helpers.rb"

class HelpersTest < Test::Unit::TestCase
  include Helpers

  def test_can_build_composite_validation_attractively
    age_validation = chain required(:age),
                          greater_than(:age, 40)
    validation = join required(:name),
                      age_validation

    candidate = Candidate.new("Fred", 50)
    errors = validation.validate(candidate)
    assert_equal([], errors)

    candidate = Candidate.new("Fred", 30)
    errors = validation.validate(candidate)
    assert_equal(["age must be over 40."], errors)

    candidate = Candidate.new("", 50)
    errors = validation.validate(candidate)
    assert_equal(["name is required."], errors)

    candidate = Candidate.new(nil, nil)
    errors = validation.validate(candidate)
    assert_equal(["name is required.", "age is required."], errors)
  end
end
