# MD5 c67a58fb2c2825d74eb35b5645d9c38c
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"

describe MustbeSecret do
  # @todo provide valid and wrong samples
  let(:proper) { [nil, -1, 0, 1, "", "string", Object.new] }
  let(:faulty) { [nil, -1, 0, 1, "", "string", Object.new] }

  it 'must return proper arguments' do
    proper.each{|arg| assert_equal arg, MustbeSecret.(arg) }
  end

  it 'must fail for faulty' do
    faulty.each{|arg| assert_raises(ArgumentError) { MustbeSecret.(arg) }}
  end
end
