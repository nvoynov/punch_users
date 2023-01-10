# MD5 17388e01d1b9ad08e64da7117c7f56ab
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"

describe MustbeOffset do
  let(:proper) { [0, 1, 2, 100] }
  let(:faulty) { [nil, -1, "string", Object.new] }

  it 'must return proper arguments' do
    proper.each{|arg| assert_equal arg, MustbeOffset.(arg) }
  end

  it 'must fail for faulty' do
    faulty.each{|arg| assert_raises(ArgumentError) { MustbeOffset.(arg) }}
  end
end
