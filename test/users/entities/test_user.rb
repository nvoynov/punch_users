# MD5 1ababb6d36e9a666bff4aed9ad9b84d1
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
include Users::Entities

describe User do
  let(:entity) { User.new(email:, signed_at:, locked_at:, locked_by:, resigned_at:) }

  it 'must do something' do
    assert entity
  end
end
