require_relative "sample"
require "punch"
include Punch::Services

domain = build_sample_domain
callback = proc{|event, payload| puts "- punching #{payload}.." }
puts "Punching Domain Skeleton.."
PunchDomain.(domain, &callback)
puts "Success!"
puts Dir.glob("#{Punch.config.lib}/**/*.rb").map{ "- #{_1}" }
