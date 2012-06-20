class Pattern
  def initialize field_name, regex, options=nil
    @field_name = field_name
    @regex = regex
    @custom_message = options[:message] unless options.nil?
  end

  def validate record
    record.send(@field_name).match(@regex).nil? ?
      [error_message] :
      []
  end

  private

  def error_message
    @custom_message.nil? ?
      @field_name.to_s + " is not formatted correctly." :
      @custom_message
  end
end
