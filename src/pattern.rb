class Pattern
  def initialize field_name, regex
    @field_name = field_name
    @regex = regex
  end

  def validate record
    record.send(@field_name).match(@regex).nil? ?
      [@field_name.to_s + " is not formatted correctly."] :
      []
  end
end
