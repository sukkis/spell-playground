#!/usr/bin/ruby

require 'csv'

require_relative 'book_in_stock'

class CsvReader

  attr_accessor :books_from_files

  def initialize()
    @books_in_stock = []
  end

  def read_in_csv_data(csv_file_name)
    CSV.foreach(csv_file_name, headers: true) do |row|
      @books_in_stock << BookInStock.new(row["ISBN"], row["Price"])
    end
  end

  def total_value_in_stock
    sum = 0.0
    @books_in_stock.each { |book| sum += book.price }   
    sum
  end
end
