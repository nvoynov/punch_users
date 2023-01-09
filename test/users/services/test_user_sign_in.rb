# MD5 a84ec662efc3c42cb4c0a526c96e0163
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
include Users::Services

describe UserSignIn do
  let(:service) { UserSignIn }
  let(:payload) { {email: @email, password: @password} }

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
