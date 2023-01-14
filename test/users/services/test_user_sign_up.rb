# MD5 7fa658e25b0758044e8eafce97442b51
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
require_relative "../data_helper"
include Users::Services
include Users::Entities

describe UserSignUp do
  let(:service) { UserSignUp }
  let(:payload) { {email: john.email, password: "pa$$w0rd"} }

  it 'must return user' do
    @mock = Minitest::Mock.new
    @mock.expect :find, nil,  [User], **{email: john.email}
    @mock.expect :put,  nil,  [Secret]
    @mock.expect :put,  john, [User]
    StorageHolder.stub :object, @mock do
      assert service.(**payload)
    end
  end

  it 'must fail when email exists' do
    storage = StorageHolder.object
    storage.stub :find, john do
      assert_raises(Service::Failure) { service.(**payload) }
    end
  end
end
