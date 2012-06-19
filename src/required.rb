class Required
  def initialize field_name
    @field_name = field_name
  end

  def validate record
    data = record.send(@field_name)
    not_provided?(data) ? [@field_name.to_s + " is required."] : []
  end

  private
  def not_provided? data
    data.nil? or is_empty?(data)
  end

  def is_empty? data
    data.empty? if data.respond_to?(:empty?)
  end

end

