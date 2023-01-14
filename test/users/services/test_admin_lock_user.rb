# MD5 fa51487383f3d337a7eebf848436e572
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
require_relative "../data_helper"
include Users::Services

describe AdminLockUser do
  let(:service) { AdminLockUser }
  let(:payload) { {email: john.email} }
  let(:storage) { StorageHolder.object }

  it {
    # must return locked user
    @mock = Minitest::Mock.new
    @mock.expect :find, john, [User], **{email: john.email}
    @mock.expect :put, john.clone_with(locked_at: Time.now), [User]
    StorageHolder.stub :object, @mock do
      result = service.(**payload)
      assert result
      assert result.locked?
    end

    # it must fail for faulty email
    storage.stub :find, nil, [User], **{email: 'faulty@co.co'} do
      assert_raises(service::Failure) { service.(**payload) }
    end
  }
end
