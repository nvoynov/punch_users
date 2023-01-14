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

      # Return klass object by id
      # @param klass [Class]
      # @param id [Object]
      # @return [Object] klass object
      def get(klass, id)
        failure("#{self.class}#get(klass, id) must be overridden")
      end

      # Return first klass object matched to criterion
      # @param klass [Class] class to get object of
      # @param criterion [keyword arguments] object matching criterion
      # @return [Object] first object that matches to criterion
      def find(klass, **criterion)
        failure("#{self.class}#get(klass, **criterion) must be overridden")
      end

      # Return collection of object matched to criterion
      # @param klass [Class] class to get objects of
      # @param criterion [keyword arguments] matching criterion
      # @return [Array<klass>] objects matched to criterion
      def all(klass, **criterion)
        failure("#{self.class}#all(klass, **criterion) must be overridden")
      end

      # Removes klass objects matched criterion
      # @param klass [Class] object class to remove of
      # @param criterion [keyword arguments] matching criterion
      # @return [Integer] number of object removed
      def rm(klass, **criterion)
        failure "#{self.class}#rm(klass, **criterion) must be overridden"
      end

      # @param klass [Class] class to get objects of
      # @param keys [*Array] identifiers to check for
      # @return [true, []] when all ids are presented
      # @return [false, [id, id]] when some ids missed
      def key?(klass, *keys)
        failure("#{self.class}.key?(klass, *keys) must be overridden")
      end

      def q(klass, where:, order:, limit:, offset:)
        failure("#{self.class}.q(klass, where:, order:, limit:, offset:) must be overridden")
      end

      protected

      def failure(message)
        fail Failure, message
      end

    end

  end
end
