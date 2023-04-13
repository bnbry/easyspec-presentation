# minitest diversion

# mintest xunit style
# assert_xyz expected, actual
class TestSquareRoot < Minitest::Test
  def test_with_a_perfect_square
    assert_equal 3, square_root(9)
  end

  def test_with_non_perfect_square
    assert_in_delta 1.4142, square_root(2)
  end
end

# mintest spec style
# actual.matcher_method expected
describe 'square_root' do
  it 'works with perfect squares' do
    square_root(9).must_equal 3
  end

  it 'works with non-perfect squares' do
    square_root(2).must_be_close_to 1.4142
  end
end
