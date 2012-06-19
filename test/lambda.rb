require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/lambda.rb"


class LambdaTest < Test::Unit::TestCase
  def tests_against_lambda_and_fails
    name_required = LambdaValidation.new do |record|
      record.name.nil? ? ["Name is required."] : []
    end
    candidate = Candidate.new(nil, 24)
    errors = name_required.validate(candidate)
    assert_equal(["Name is required."], errors)
  end
end

