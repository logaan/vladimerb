require_relative "test_helper.rb"

class JoinTest < Test::Unit::TestCase
  def test_shows_all_errors
    assert_errors Candidate.new(nil, nil),
                  join(required(:name),
                       required(:age)),
                  ["name is required.", "age is required."]
  end
end
