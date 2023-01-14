# MD5 179c13b1c2ea68ca6e544fcd0b7817b5
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"
require_relative "../data_helper"
include Users::Services

describe AdminQueryUsers do
  let(:service) { AdminQueryUsers }
  let(:payload) { {email: john.email} }
  let(:storage) { StorageHolder.object }

  # what to test there? validate user input?
  it {
    skip "design test for AdminQueryUsers"
  }
end
