# MD5 96a4d7cf685e7d6a01ef1e75f2ff45e0
# see https://github.com/nvoynov/punch
# frozen_string_literal: true
require_relative "../basics"

module Users
  module Plugins

    # Entity storage interface
    class Storage
      extend Plugin

      Failure = Class.new(StandardError)

      def self.inherited(klass)
        klass.const_set(:Failure, Class.new(klass::Failure))
        super
      end

      # Puts entity to the storage
      # @param entity [Entity] to store
      # @return [Entity] first entity
      def put(*entities)
      end

      # Return first entity klass instance matched to **kwargs criteria
      # @param klass [Class<Entity>] entity class to get from
      # @param kwargs [keyword arguments] matching criterias
      # @return [Entity] first entity of klass that matches to **kwargs
      def get(klass, **kwargs)
      end

      # Return collection of entities matched to **kwargs criteria
      # @param klass [Class<Entity>] entity class to get from
      # @param kwargs [keyword arguments] matching criterias
      # @return [Array<klass>] entities of klass match to **kwargs
      def all(klass, **kwargs)
      end

      # @param klass [Class<Entity>] entity class to get from
      # @param id [Id] identifiers to check for
      # @return [Boolean] true when storage holds klass entities with ids
      def key?(klass, *keys)
      end

      # Removes entities from storage by **kwargs criteria
      # @param klass [Class<Entity>] entity class to remove from
      # @param **kwargs [Hash] @todo conditions to remove
      # @return [Integer] number of entities removed
      def rm(klass, **kwargs)
      end

      def query(klass, filter:, order:, limit:, offset:)
      end
    end

  end
end
