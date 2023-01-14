def failure(message)
  raise StandardError, message, caller[0..-1]
end

def foo
  1 + 1
  failure "bla-bla line 7"
end

foo
