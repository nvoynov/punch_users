# MD5 766a4b4e3bf6958e3827e12eab10ddb7
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
include Users::Plugins

class TestSecrets < Minitest::Test
  def plugin
    Secrets.new()
  end

  def test_something
  end
end
