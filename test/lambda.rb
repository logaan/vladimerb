require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/lambda.rb"


class LambdaTest < Test::Unit::TestCase
  def tests_against_lambda_and_fails
    assert_errors Candidate.new(nil, 24),
                  (LambdaValidation.new do |record|
                    record.name.nil? ? ["Name is required."] : []
                  end),
                  ["Name is required."]
  end
end

