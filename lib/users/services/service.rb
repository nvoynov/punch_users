require_relative "../basics"
require_relative "../config"
require_relative "../entities"
include Users::Entities
require "forwardable"

module Users
  module Services

    # domain servie to inherit, injects storage and secret pluging
    class Service < Punch::Service
      extend Forwardable
      def_delegator :StorageHolder, :object, :storage
      def_delegator :SecretsHolder, :object, :secrets
    end

  end
end
