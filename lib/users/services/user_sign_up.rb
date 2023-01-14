# MD5 bfa2451cba0e9c1369ebd077fb17e59b
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "service"

module Users
  module Services

    class UserSignUp < Service
      def initialize(email:, password:)
        @email = MustbeEmail.(email)
        @password = MustbePassword.(password)
      end

      def call
        user = storage.find(User, email: @email)
        failure("Email already registered") if user
        user = User.new(email: @email, signed_at: Time.now)
        hash = secrets.secret(@password)
        secret = Secret.new(email: @email, secret: hash)
        storage.put(secret)
        storage.put(user)
      end
    end

  end
end
