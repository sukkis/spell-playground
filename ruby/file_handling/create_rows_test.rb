require 'minitest/autorun'

class CreateRowsTest < Minitest::Test

  def test_starting_situation
    lines = Array.new
    File.foreach('input.txt') do |line|
      lines.push(line)
    end
    assert_equal(5, lines.length)
    puts "test 1: length of array 'lines'"
  end

  def test_output_contains_right_amount_of_lines
    outputLines = Array.new
    File.foreach('output.txt') do |line|
      outputLines.push(line)
    end
    assert_equal(17, outputLines.length)
    puts "test : number of output lines is correct"

  end

  def test_output_file_contains_relevant_results
    assert_equal(1, File.readlines('output.txt').grep(/abc\;abc\;1/).length)
    puts "test : abc replaces abc with scaling factor 1"

    assert_equal(1, File.readlines('output.txt').grep(/abc\;cde\;0,7/).length)
    puts "test : abc replaces cde with scaling factor 0,7"

    assert_equal(1, File.readlines('output.txt').grep(/bcd\;bcd\;0,7/).length)
    puts "test : abc replaces cde with scaling factor 0,7"

    assert_equal(1, File.readlines('output.txt').grep(/cde\;def\;1/).length)
    puts "test : cde replaces def with scaling factor 1"

    assert_equal(1, File.readlines('output.txt').grep(/def\;abc\;0,7/).length)
    puts "test : def replaces abc with scaling factor 0,7"
  end
end
