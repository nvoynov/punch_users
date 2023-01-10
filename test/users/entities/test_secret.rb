# MD5 25675cabd11db2558d65a9cf19f5bca5
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
include Users::Entities

describe Secret do
  let(:entity) { Secret.new(email: "john@co.com", secret: '') }

  it 'must do something' do
    assert entity
  end
end
