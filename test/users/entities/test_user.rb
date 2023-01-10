# MD5 1ababb6d36e9a666bff4aed9ad9b84d1
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
include Users::Entities

describe User do
  let(:entity) { User.new(email: "john@co.com", signed_at: Time.now) }

  it 'must do something' do
    assert entity
  end
end
