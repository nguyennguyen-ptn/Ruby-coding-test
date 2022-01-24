class OutputBuilder
  def initialize(items, total, total_tax)
    @items = items
    @total = total
    @total_tax = total_tax
  end

  def build
    return @output if @output

    @output = ''
    @items.each do |item|
      price = format('%.2f', (item.price + item.tax) * item.quantity)
      @output << "#{item.quantity}, #{item.name}, #{price}\n"
    end
    @output << "\n"
    @output << "Sales Taxes: #{format('%.2f', @total_tax)}\n"
    @output << "Total: #{format('%.2f', @total)}\n"
    @output
  end
end
