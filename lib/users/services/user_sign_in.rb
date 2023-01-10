# MD5 4e29071b20ec8225a7386b5fc561c46a
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "../basics"
require_relative "../config"
require_relative "../entities"
include Users::Entities
require "forwardable"

module Users
  module Services
    #
    class UserSignIn < Service
      extend Forwardable
      def_delegator :StorageHolder, :object, :storage
      def_delegator :SecretsHolder, :object, :secrets

      def initialize(email:, password:)
        @email = MustbeEmail.(email)
        @password = MustbePassword.(password)
      end

      def call
        user = storage.get(User, email: @email)
        failure("Wrong login or password") unless user
        secret = storage.get(Secret, email: @email)
        failure("Wrong login or password") unless secret
        hash = secrets.secret(@password)
        failure("Wrong login or password") unless secret.secret == hash
        # @todo check for locked account
        user
      end
    end

  end
end
