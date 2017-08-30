#!/usr/bin/ruby

# Breaks down a matrix to a normal csv representation,
# with a header and data rows

lines = Array.new

File.foreach('input.txt') do |line|
	lines.push(line)
end

# Separate the horizontal header row and vertical header column
headerRow = lines[0].split(';')

headerColumn = Array.new
lines.each do |line|
	headerColumn.push(line.split(';')[0])
end

def write_transformed_row(airline1, airline2, factor)
	open('output.txt', 'a') do |f|
		f.puts "#{airline1};#{airline2};#{factor}" if (airline1 != '' && !(factor.count("a-zA-Z") > 0))
		puts "#{airline1};#{airline2};#{factor}" if airline1 != '' && !(factor.count("a-zA-Z") > 0)
	end
end

def write_header_row()
	open('output.txt', 'a') do |f|
		f.puts "airline1;airline2;factor"
		puts "airline1;airline2;factor"
	end
end

write_header_row()

# Go through the matrix, create several rows from one row
counter = 0
lines.each do |line|

  splitRow = line.split(';')
        airline1 = splitRow[0]
	splitRow.each do |column|
    airline2 = headerColumn[counter]
	  counter += 1
    write_transformed_row(airline1, airline2, column) if airline1 != '' && airline2 != ''
		if counter == headerColumn.length+1
			counter = 1
		end
  end
end
