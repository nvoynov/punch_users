# MD5 4e29071b20ec8225a7386b5fc561c46a
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "service"

module Users
  module Services

    class UserSignIn < Service
      def initialize(email:, password:)
        @email = MustbeEmail.(email)
        @password = MustbePassword.(password)
      end

      def call
        user = storage.find(User, email: @email)
        failure("Wrong login or password") unless user
        secret = storage.find(Secret, email: @email)
        failure("Wrong login or password") unless secret
        hash = secrets.secret(@password)
        failure("Wrong login or password") unless secret.secret == hash
        failure("User account locked!") if user.locked?
        user
      end
    end

  end
end
