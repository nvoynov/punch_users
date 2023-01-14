# MD5 dcedaab094f6a1094a7ecf873e5e70be
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "service"

module Users
  module Services
    #
    class AdminUnlockUser < Service

      def initialize(email:)
        @email = MustbeEmail.(email)
      end

      def call
        user = storage.find(User, email: @email)
        failure("Email uknown") unless user
        user = user.clone_with(locked_at: nil)
        storage.put(user)
      end
    end

  end
end
