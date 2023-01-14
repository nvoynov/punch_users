# MD5 88834ff0b988ab928fa931ee041749a2
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "service"

module Users
  module Services

    class UserChangePassword < Service
      def initialize(email:, password:, new_password:)
        @email = MustbeEmail.(email)
        @password = MustbePassword.(password)
        @new_password = MustbePassword.(new_password)
      end

      def call
        user = storage.find(User, email: @email)
        failure("Wrong login or password") unless user

        secret = storage.find(Secret, email: @email)
        failure("Wrong login or password") unless secret

        hash = secrets.secret(@password)
        failure("Wrong login or password") unless secret.secret == hash

        hash = secrets.secret(@password)
        secret = secret.clone_with(secret: hash)
        storage.put(secret)

        user
      end
    end

  end
end
