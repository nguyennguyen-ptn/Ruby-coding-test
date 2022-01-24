class ReceiptLineItem
  EXEMPTION_LIST = %w[book chocolate pill]

  attr_reader :quantity, :name, :price
  attr_accessor :tax

  def initialize(quantity, name, price)
    @quantity = quantity
    @name = name
    @price = price
    @imported = name.include?('imported')
  end

  def exempt?
    @exempt ||= EXEMPTION_LIST.any? { |exemption| name.include?(exemption) }
  end

  def imported?
    @imported
  end
end
