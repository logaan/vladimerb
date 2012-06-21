require_relative "test_helper.rb"

class LambdaTest < Test::Unit::TestCase
  include Vladimerb

  def tests_against_lambda_and_fails
    assert_errors Candidate.new(nil, 24),
                  (lambda_validation do |record|
                    record.name.nil? ? ["Name is required."] : []
                  end),
                  ["Name is required."]
  end
end

