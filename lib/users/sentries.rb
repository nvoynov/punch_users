# frozen_string_literal: true
require_relative "basics"

# MustbeString
MustbeString = Sentry.new(:key, 'must be String') {|v| v.is_a?(String)}

# must be valid email address
MustbeEmail = Sentry.new(:key, "must be valid email address"
) {|v|
  rx = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  v.is_a?(String) && v.length.between?(5,50) && rx =~ v
}

# at least 8 symbols with digits
MustbePassword = Sentry.new(:key, "at least 8 symbols with digits"
) {|v| v.is_a?(String) && v.size > 7 && v =~ /\d/}

# must be Limit
MustbeLimit = Sentry.new(:key, "must be Limit"
) {|v| v.is_a?(Integer) && v > 0}

# must be Offset
MustbeOffset = Sentry.new(:key, "must be Offset"
) {|v| v.is_a?(Integer) && v >= 0}
