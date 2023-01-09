# MD5 39f5e917c00483dd3cb90275d7960e0b
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "../basics"

module Users
  module Services
    # 
    class AdminQueryUsers < Service

      def initialize(limit:, offset:)
        @limit = MustbeLimit.(limit)
        @offset = MustbeOffset.(offset)
      end

      def call
        # user = storage.get(User, email: @email)
        # failure("Email already exists") if user
        # user = User.new(limit: @limit, offset: @offset)
        # storage.put(user)
        failure("UNDER CONSTRUCTION")
      end
    end

  end
end
