# MD5 7ca7380ab8d1dcead03776f42011531a
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "service"

module Users
  module Services

    class AdminLockUser < Service
      def initialize(email:)
        @email = MustbeEmail.(email)
      end

      def call
        user = storage.find(User, email: @email)
        failure("Email uknown") unless user
        user = user.clone_with(locked_at: Time.now)
        storage.put(user)
      end
    end

  end
end
