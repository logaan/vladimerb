must_be_nil = :nil?.to_proc # => some lambda
must_be_nil == lambda{|value| value.nil? } # => true
must_be_nil.call("asfd") # => false
must_be_nil.call(nil) # => true


"I love %s in my mouth" % "Teddies" # => "I love Teddies in my mouth"

def foo(&bar)
  bar.call
end

foo do
  puts "cats"
end
# => Will print cats
