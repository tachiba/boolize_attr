require 'minitest/autorun'
require 'boolize_attr'

class TestBoolizeAttr < Minitest::Test
  def setup
    @klass = Class.new
    @klass.include BoolizeAttr
  end

  def test_reader
    @klass.class_eval do
      attr_accessor :hoge
      boolize_attr_reader :hoge
    end

    @instance = @klass.new

    assert_equal false, @instance.hoge

    @instance.hoge = '0'

    assert_equal false, @instance.hoge

    @instance.hoge = '1'

    assert_equal true, @instance.hoge
  end

  def test_accessor
    @klass.class_eval do
      boolize_attr_accessor :hoge
    end

    @instance = @klass.new

    assert_equal false, @instance.hoge

    @instance.hoge = '0'

    assert_equal false, @instance.hoge

    @instance.hoge = '1'

    assert_equal true, @instance.hoge
  end
end
