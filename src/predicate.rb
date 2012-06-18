class Predicate
  def initialize field_name, method, msg
    @field_name = field_name
    @method = method.to_proc
    @msg = msg
  end

  def validate record
    @method.call(record.send(@field_name)) ? [] : [@msg]
  end
end
