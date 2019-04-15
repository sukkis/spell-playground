#!/usr/bin/ruby

puts File.readlines('output.txt').grep(/abc\;abc\;1/)
