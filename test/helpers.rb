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

  def test_lambda_validations_can_be_built_with_blocks
    validation = lambda_validation do |candidate|
      (candidate.name.to_s + candidate.age.to_s).length > 10 ?
        ["Name and Age combined take up too much room to display"] : []
    end

    candidate = Candidate.new("Colin Logan Campbell-McPherson", 24)
    errors = validation.validate(candidate)
    assert_equal(["Name and Age combined take up too much room to display"], errors)
  end

  def test_lambda_validations_can_be_built_with_blocks
    validation = pattern(:name, /^[a-zA-Z]+$/)
    candidate = Candidate.new("Logan Campbell-McPherson", 24)
    errors = validation.validate(candidate)
    assert_equal(["name is not formatted correctly."], errors)
  end
end

