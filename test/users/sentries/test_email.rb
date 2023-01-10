# MD5 d19ce7cb8a525764abd1b2fa9d70a3c7
# see https://github.com/nvoynov/punch
require_relative "../../test_helper"

describe MustbeEmail do
  let(:proper) { ["a@b.c", "user@example.com", "joe.dep@co.com.ua"] }
  let(:faulty) { [nil, 1, Object.new, "@b.c", "a@b"] }

  it 'must return proper arguments' do
    proper.each{|arg| assert_equal arg, MustbeEmail.(arg) }
  end

  it 'must fail for faulty' do
    faulty.each{|arg| assert_raises(ArgumentError) { MustbeEmail.(arg) }}
  end
end
