# MD5 4d528ca27ce754f02531b25cba6eb298
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "../basics"

module Users
  module Entities
    # 
    class User < Entity
      # @return [Email] 
      attr_reader :email
      
      # @return [Object] 
      attr_reader :signed_at
      
      # @return [Object] 
      attr_reader :locked_at
      
      # @return [Object] 
      attr_reader :locked_by
      
      # @return [Object] 
      attr_reader :resigned_at

      def initialize(id: nil, email:, signed_at:, locked_at:, locked_by:, resigned_at:)
        super(id)
        @email = MustbeEmail.(email)
        @signed_at = signed_at
        @locked_at = locked_at
        @locked_by = locked_by
        @resigned_at = resigned_at
      end
    end

  end
end
