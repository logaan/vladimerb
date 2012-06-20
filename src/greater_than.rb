require_relative "namespace"

class Vladimerb::GreaterThan
  def initialize field_name, minimum
    @field_name = field_name
    @minimum = minimum
  end

  def validate record
    record.send(@field_name) > @minimum ?
      [] :
      [@field_name.to_s + " must be over " + @minimum.to_s + "." ]
  end
end
