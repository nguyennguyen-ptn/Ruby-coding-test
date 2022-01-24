require_relative './receipt_line_item'

class InputReader
  attr_reader :items

  def initialize(path)
    @path = path
  end

  def read
    return @items if @items

    @items = []
    lines = File.readlines(@path)
    headers = lines.first.split(',').map(&:strip)
    if headers[0].downcase != 'quantity' || headers[1].downcase != 'product' || headers[2].downcase != 'price'
      raise 'Unexpected input header'
    end

    lines.drop(1).each do |line|
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
