class TaxCalculator
  def item_tax_rate(item)
    tax_rate = 0
    tax_rate += 10 / 100.0 unless item.exempt?
    tax_rate += 5 / 100.0 if item.imported?
    tax_rate
  end

  def calculate(items)
    total = 0
    total_tax = 0

    items.each do |item|
      item.tax = round_up(item.price * item_tax_rate(item))
      total_tax += item.tax * item.quantity
      total += item.price + item.tax * item.quantity
    end
    [items, total, total_tax]
  end

  def round_up(number)
    if number.floor(2) - number.floor(1) == 0
      number
    elsif number.floor(2) - number.floor(1) <= 0.05
      number.floor(1) + 0.05
    else
      number.floor(1) + 0.1
    end
  end
end
