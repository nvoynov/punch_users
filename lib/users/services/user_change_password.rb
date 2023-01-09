# MD5 88834ff0b988ab928fa931ee041749a2
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "../basics"

module Users
  module Services
    # 
    class UserChangePassword < Service

      def initialize(email:, password:, new_password:)
        @email = MustbeEmail.(email)
        @password = MustbePassword.(password)
        @new_password = MustbePassword.(new_password)
      end

      def call
        # user = storage.get(User, email: @email)
        # failure("Email already exists") if user
        # user = User.new(email: @email, password: @password, new_password: @new_password)
        # storage.put(user)
        failure("UNDER CONSTRUCTION")
      end
    end

  end
end
