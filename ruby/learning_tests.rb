require 'test/unit'

class StringTest < Test::Unit::TestCase

  def test_length
    s = "Hello, World!"
    assert_equal(13, s.length)
    puts "test 1: length of 'Hello World'"	
  end

  def test_times
    s = "hello"	
    assert_equal("hello", s)
    puts "test 2: 3.times {puts s}"	
    3.times {puts s}	
  end

  def test_upto
    result = ""
    'a'.upto('e') { |x| result+= x }
    assert_equal("abcde", result)
    puts "test 3: 'a'.upto('e') { |x| result += x } "
  end

end
