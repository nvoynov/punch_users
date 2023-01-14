# MD5 ebaedd4c28aa4da209548b97cc85e5f1
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "service"

module Users
  module Services

    class UserResign < Service
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
        storage.rm(User, id: user.id)
        storage.rm(Secret, id: secret.id)
      end
    end

  end
end
