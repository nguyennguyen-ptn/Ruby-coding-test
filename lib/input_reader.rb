require_relative './receipt_line_item'

class InputReader
  attr_reader :items

  def initialize(path)
    @path = path
  end

  def read
    return @items if @items

    @items = []
    File.readlines(@path).each do |line|
      values = line.split(',')
      next if values.length != 3

      quantity = values[0].to_i
      name = values[1].strip
      price = values[2].to_f
      @items << ReceiptLineItem.new(quantity, name, price)
    end
    @items
  end
end
