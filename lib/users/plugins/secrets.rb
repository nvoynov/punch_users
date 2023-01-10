# MD5 949913b2826c0ba55debfaca6c09e328
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "../basics"
require "digest"

module Users
  module Plugins
    #
    class Secrets
      extend Plugin

      def secret(string)
        Digest::MD5.hexdigest(string)
      end
    end

  end
end
