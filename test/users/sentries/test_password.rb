# MD5 200b5286c747904c1c903bb0a46a0fcd
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"

describe MustbePassword do
  # @todo provide valid and wrong samples
  let(:proper) { [nil, -1, 0, 1, "", "string", Object.new] }
  let(:faulty) { [nil, -1, 0, 1, "", "string", Object.new] }

  it 'must return proper arguments' do
    proper.each{|arg| assert_equal arg, MustbePassword.(arg) }
  end

  it 'must fail for faulty' do
    faulty.each{|arg| assert_raises(ArgumentError) { MustbePassword.(arg) }}
  end
end
