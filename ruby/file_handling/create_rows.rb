#!/usr/bin/ruby

# Breaks down a matrix to a normal csv representation,
# with a header and data rows

lines = Array.new


File.foreach('input.txt') do |line|
	lines.push(line)
end

# Separate the horizontal header row
headerRow = lines[0].split(/[\;]/)

# Separate the vertical header row
headerColumn = Array.new
lines.each do |line|
	headerColumn.push(line.split(/[\;]/)[0])
end

# Write out the transformed rows

def write_transformed_row(row)
	open('output.txt', 'a') do |f|
		f.puts row
	end
end

# create several rows from one row
counter = 1
lines.each do |line|

	splitRow = line.split(';')
        airline1 = splitRow[0] if not nil
	splitRow.each do |column|
           airline2 = headerColumn[counter]
	   counter += 1
	   row = airline1
	   write_transformed_row(row) 
	end
end


#puts headerRow
#puts headerColumn
#write_transformed_row("hehe")
#write_transformed_row("hehheheeee")
