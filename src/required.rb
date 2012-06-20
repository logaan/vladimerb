class Required
  def initialize field_name, options=nil
    @field_name = field_name
    @custom_message = options[:message] unless options.nil?
  end

  def validate record
    data = record.send(@field_name)
    not_provided?(data) ? [error_message] : []
  end

  private
  def error_message
    @custom_message.nil? ?
      @field_name.to_s + " is required." :
      @custom_message
  end

  def not_provided? data
    data.nil? or is_empty?(data)
  end

  def is_empty? data
    data.empty? if data.respond_to?(:empty?)
  end

end

