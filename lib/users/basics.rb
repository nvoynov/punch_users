require_relative "basics/entity.rb"
require_relative "basics/plugin.rb"
require_relative "basics/sentry.rb"
require_relative "basics/service.rb"

# declare basics in your own namespace
Sentry = Punch::Sentry
Entity = Punch::Entity
Plugin = Punch::Plugin

module CloneWith
  def clone_with(**params)
    faulty = params.keys.reject{|k| self.respond_to?(k)}
    fail ArgumentError, "unknown keys: #{faulty}" if faulty.any?
    self.clone.tap{|klone|
      params.each{|key, val|
        klone.instance_variable_set("@#{key}".to_sym, val)
      }
    }
  end
end

class Entity
  include CloneWith
end
