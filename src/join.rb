class Join
  def initialize required_1, required_2
    @validation_1 = required_1
    @validation_2 = required_2
  end

  def validate record
    @validation_1.validate(record) + @validation_2.validate(record)
  end
end

