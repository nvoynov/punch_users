# MD5 dcedaab094f6a1094a7ecf873e5e70be
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "../basics"

module Users
  module Services
    # 
    class AdminUnlockUser < Service

      def initialize(email:)
        @email = MustbeEmail.(email)
      end

      def call
        # user = storage.get(User, email: @email)
        # failure("Email already exists") if user
        # user = User.new(email: @email)
        # storage.put(user)
        failure("UNDER CONSTRUCTION")
      end
    end

  end
end
