# MD5 d631552b3848d7869b1745316b8afe8d
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
include Users::Plugins

class TestStorage < Minitest::Test
  def plugin
    Storage.new()
  end

  def test_something
  end
end
