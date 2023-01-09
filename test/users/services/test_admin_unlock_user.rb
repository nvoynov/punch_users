# MD5 36995b29d111cde8b1b736d241dd1e0b
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
include Users::Services

describe AdminUnlockUser do
  let(:service) { AdminUnlockUser }
  let(:payload) { {email: @email} }

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
