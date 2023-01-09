# frozen_string_literal: true

require_relative "basics"
include Punch

# MustbeString
MustbeString = Sentry.new(:key, 'must be String') {|v| v.is_a?(String)}

# must be valid email address
MustbeEmail = Sentry.new(:key, "must be valid email address"
) {|v| fail "UNDER CONSTRUCTION"}

# at least 8 symbols with digits
MustbePassword = Sentry.new(:key, "at least 8 symbols with digits"
) {|v| fail "UNDER CONSTRUCTION"}
# must be Secret
MustbeSecret = Sentry.new(:key, "must be Secret"
) {|v| fail "UNDER CONSTRUCTION"}
# must be Limit
MustbeLimit = Sentry.new(:key, "must be Limit"
) {|v| fail "UNDER CONSTRUCTION"}

# must be Offset
MustbeOffset = Sentry.new(:key, "must be Offset"
) {|v| fail "UNDER CONSTRUCTION"}
