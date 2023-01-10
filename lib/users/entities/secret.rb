# MD5 9c148c49704280f8e1ec004e95407c35
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "../basics"

module Users
  module Entities
    #
    class Secret < Entity
      # @return [Email]
      attr_reader :email

      # @return [Secret]
      attr_reader :secret

      def initialize(id: nil, email:, secret:)
        super(id)
        @email = MustbeEmail.(email)
        @secret = secret
      end
    end

  end
end
