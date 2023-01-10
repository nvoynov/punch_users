# MD5 af4ab4123f3c62c53a654ce0d2d729f9
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"

describe MustbeLimit do
  let(:proper) { [1, 2, 100] }
  let(:faulty) { [nil, -1, 0, "string", Object.new] }

  it 'must return proper arguments' do
    proper.each{|arg| assert_equal arg, MustbeLimit.(arg) }
  end

  it 'must fail for faulty' do
    faulty.each{|arg| assert_raises(ArgumentError) { MustbeLimit.(arg) }}
  end
end
