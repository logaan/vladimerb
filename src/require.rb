class Required
  def initialize field_name
    @field_name = field_name
  end

  def validate record
    data = record.send(@field_name)
    data.nil?|| data.empty? ? [@field_name.to_s + " is required."] : []
  end

end

