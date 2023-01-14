# MD5 cec89eabf1fc61b2dd71de3adc4b5f3f
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
require_relative "../data_helper"
include Users::Services

describe UserChangePassword do
  let(:service)  { UserChangePassword }
  let(:storage)  { StorageHolder.object }
  let(:password) { "pa$$w0rd" }
  let(:payload)  {{
    email: john.email,
    password: password,
    new_password: 'new' + password
  }}
  let(:secret) { Secret.new(email: john.email,
      secret: SecretsHolder.object.secret(password))
  }
  let(:faulty_email)  { "unknow@co.com" }
  let(:faulty_secret) { Secret.new(email: john.email,
      secret: SecretsHolder.object.secret("wr0ngpa$$w0rd"))
  }

  it {
    # success
    @mock = Minitest::Mock.new
    @mock.expect :find, john, [User], **{email: john.email}
    @mock.expect :find, secret, [Secret], **{email: john.email}
    @mock.expect :put, secret, [Secret]
    StorageHolder.stub :object, @mock do
      assert_kind_of User, service.(**payload)
    end

    # it must fail for faulty email
    storage.stub :find, nil do
      assert_raises(Service::Failure) { service.(**payload) }
    end

    # it must fail for faulty password
    @mock.expect :find, john, [User], **{email: john.email}
    @mock.expect :find, faulty_secret, [Secret], **{email: john.email}
    StorageHolder.stub :object, @mock do
      assert_raises(Service::Failure) { service.(**payload) }
    end
  }
end
