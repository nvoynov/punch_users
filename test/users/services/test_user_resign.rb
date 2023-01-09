# MD5 891f935489f09ff3b33b6c1495af27d1
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
include Users::Services

describe UserResign do
  let(:service) { UserResign }
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
