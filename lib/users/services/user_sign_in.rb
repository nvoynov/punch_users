# MD5 4e29071b20ec8225a7386b5fc561c46a
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "../basics"

module Users
  module Services
    # 
    class UserSignIn < Service

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
