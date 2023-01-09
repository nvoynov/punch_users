# MD5 179c13b1c2ea68ca6e544fcd0b7817b5
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
include Users::Services

describe AdminQueryUsers do
  let(:service) { AdminQueryUsers }
  let(:payload) { {limit: @limit, offset: @offset} }

  it 'must #call' do
    # assumed that there are no plugins implementations at the stage
    # so instead of just "assert service.(**payload)", plugins should
    # be mocked, or maybe stubbed for only one plugin an one method
    #
    # PluginHolder.object.stub :get, dummy do
    #   result = service.(**payload)
    #   assert_equal dummy, result
    # end#
    #
    # @mock = Minitest::Mock.new
    # @mock.expect :get, dummy, [User], **payload
    # @mock.expect :put, dummy, [User]
    # PluginHolder.stub :object, @mock do
    #   result = service.(**payload)
    #   assert_equal dummy, result
    # end
  end
end
