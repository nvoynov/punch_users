# MD5 891f935489f09ff3b33b6c1495af27d1
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
require_relative "../data_helper"
include Users::Services

describe UserResign do
  let(:service) { UserResign }
  let(:storage)  { StorageHolder.object }
  let(:password) { "pa$$w0rd" }
  let(:payload)  { {email: john.email, password: password} }
  let(:secret)   { Secret.new(email: john.email,
      secret: SecretsHolder.object.secret(password))
  }
  let(:faulty_email)  { "unknow@co.com" }
  let(:faulty_secret) { Secret.new(email: john.email,
    secret: SecretsHolder.object.secret("wr0ngpa$$w0rd"))
  }

  it {
    # succes
    @mock = Minitest::Mock.new
    @mock.expect :find, john, [User], **{email: john.email}
    @mock.expect :find, secret, [Secret], **{email: john.email}
    @mock.expect :rm, Integer, [User], **{id: String}
    @mock.expect :rm, Integer, [Secret], **{id: String}
    StorageHolder.stub :object, @mock do
      service.(**payload)
    end

    # it must fail for faulty email
    storage.stub :find, nil do
      assert_raises(Service::Failure) { service.(**payload) }
    end

    # it must fail for faulty password
    @mock = Minitest::Mock.new
    @mock.expect :find, john, [User], **{email: john.email}
    @mock.expect :find, faulty_secret, [Secret], **{email: john.email}
    StorageHolder.stub :object, @mock do
      assert_raises(Service::Failure) { service.(**payload) }
    end
  }
end
