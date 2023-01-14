# MD5 36995b29d111cde8b1b736d241dd1e0b
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
require_relative "../data_helper"
include Users::Services

describe AdminUnlockUser do
  let(:service) { AdminUnlockUser }
  let(:payload) { {email: john.email} }
  let(:storage) { StorageHolder.object }

  it {
    # must return ulocked user
    @mock = Minitest::Mock.new
    @mock.expect :find, john, [User], **{email: john.email}
    @mock.expect :put, john.clone_with(locked_at: nil), [User]
    StorageHolder.stub :object, @mock do
      refute service.(**payload).locked?
    end

    # it must fail for faulty email
    storage.stub :find, nil, [User], **{email: 'faulty@co.co'} do
      assert_raises(service::Failure) { service.(**payload) }
    end
  }
end
