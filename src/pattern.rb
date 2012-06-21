require_relative "namespace"

class Vladimerb::Pattern
  def initialize field_name, regex, options = nil
    @field_name = field_name
    @regex = regex
    @custom_message = options[:message] unless options.nil?
  end

  def validate record
    check_nil(record.send(@field_name))
  end

  private

  # TODO: Not happy with this method name
  def check_nil(value)
    value.nil? ?
      [] : check_match(value)
  end

  def check_match(value)
    value.match(@regex).nil? ?
      [error_message] : []
  end

  def error_message
    @custom_message.nil? ?
      @field_name.to_s + " is not formatted correctly." :
      @custom_message
  end
end
