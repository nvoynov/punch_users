# MD5 bfa2451cba0e9c1369ebd077fb17e59b
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "../basics"

module Users
  module Services
    # 
    class UserSignUp < Service

      def initialize(email:, password:)
        @email = MustbeEmail.(email)
        @password = MustbePassword.(password)
      end

      def call
        # user = storage.get(User, email: @email)
        # failure("Email already exists") if user
        # user = User.new(email: @email, password: @password)
        # storage.put(user)
        failure("UNDER CONSTRUCTION")
      end
    end

  end
end
