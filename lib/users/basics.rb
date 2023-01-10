require_relative "basics/entity.rb"
require_relative "basics/plugin.rb"
require_relative "basics/sentry.rb"
require_relative "basics/service.rb"

# declare basics in your own namespace
Sentry = Punch::Sentry
Entity = Punch::Entity
Plugin = Punch::Plugin
Service = Punch::Service
