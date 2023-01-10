# MD5 200b5286c747904c1c903bb0a46a0fcd
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"

describe MustbePassword do
  let(:proper) { ["querty12", "pa$$w0rd"] }
  let(:faulty) { [nil, 0, Object.new, "querty", "long string"] }

  it 'must return proper arguments' do
    proper.each{|arg| assert_equal arg, MustbePassword.(arg) }
  end

  it 'must fail for faulty' do
    faulty.each{|arg| assert_raises(ArgumentError) { MustbePassword.(arg) }}
  end
end
