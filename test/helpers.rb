require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/helpers.rb"

class HelpersTest < Test::Unit::TestCase
  include Helpers

  def test_join_can_compose_multiple_validations
    assert_errors Candidate.new("Fred", 50),
                  join(required(:name),
                       required(:age),
                       greater_than(:age, 40)),
                  []
  end

  def test_chain_can_compose_multiple_validations
    assert_errors Candidate.new(nil, nil),
                  chain(required(:name),
                        required(:age),
                        greater_than(:age, 40)),
                  ["name is required."]
  end

  def test_can_build_composite_validation_attractively
    validation = join(required(:name),
                      chain(required(:age),
                            greater_than(:age, 40)))

    assert_errors Candidate.new("Fred", 50), validation,
                  []

    assert_errors Candidate.new("Fred", 30), validation,
                  ["age must be over 40."]

    assert_errors Candidate.new("", 50), validation,
                  ["name is required."]

    assert_errors Candidate.new(nil, nil), validation,
                  ["name is required.", "age is required."]
  end

  def test_lambda_validations_can_be_built_with_blocks
    assert_errors Candidate.new("Colin Logan Campbell-McPherson", 24),
                  (lambda_validation do |candidate|
                    (candidate.name.to_s + candidate.age.to_s).length > 10 ?
                      ["Name and Age combined take up too much room to display"] : []
                  end),
                 ["Name and Age combined take up too much room to display"]
  end

  def test_pattern_validations_can_be_built_with_blocks
    assert_errors Candidate.new("Logan Campbell-McPherson", 24),
                  pattern(:name, /^[a-zA-Z]+$/),
                  ["name is not formatted correctly."]
  end

  def test_predicate_can_be_built_with_blocks
    assert_errors Candidate.new("Jill", 24),
                  predicate(:name, :nil?, "Name must be nil."),
                  ["Name must be nil."]
  end
end

