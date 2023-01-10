# MD5 a84ec662efc3c42cb4c0a526c96e0163
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
require_relative "../data_helper"
include Users::Services

describe UserSignIn do
  let(:service)  { UserSignIn }
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

  it 'must return user' do
    @mock = Minitest::Mock.new
    @mock.expect :get, john, [User], **{email: john.email}
    @mock.expect :get, secret, [Secret], **{email: john.email}
    StorageHolder.stub :object, @mock do
      assert service.(**payload)
    end
  end

  it 'must fail for faulty email' do
    storage.stub :get, nil do
      assert_raises(Service::Failure) { service.(**payload) }
    end
  end

  it 'must fail for faulty password' do
    @mock = Minitest::Mock.new
    @mock.expect :get, john, [User], **{email: john.email}
    @mock.expect :get, faulty_secret, [Secret], **{email: john.email}
    StorageHolder.stub :object, @mock do
      assert_raises(Service::Failure) { service.(**payload) }
    end
  end
end
