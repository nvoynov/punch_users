# MD5 39f5e917c00483dd3cb90275d7960e0b
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "service"

module Users
  module Services
    #
    class AdminQueryUsers < Service

      def initialize(limit:, offset:)
        @limit = MustbeLimit.(limit)
        @offset = MustbeOffset.(offset)
      end

      def call
        storage.q(User, limit: @limit, offset: @offset)
      end
    end

  end
end
