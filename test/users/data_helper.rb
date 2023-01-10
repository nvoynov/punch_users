require_relative "../test_helper"
include Users::Entities

def john
  User.new(email: 'john@co.com', signed_at: Time.now)
end

def jane
  User.new(email: 'jane@co.com', signed_at: Time.now)
end
