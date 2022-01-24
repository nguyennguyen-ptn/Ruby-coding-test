require_relative './input_reader'
require_relative './tax_calculator'
require_relative './output_builder'

class Application
  def self.run!(path)
    items = InputReader.new(path).read
    items, total, total_tax = TaxCalculator.new.calculate(items)
    output = OutputBuilder.new(items, total, total_tax).build
    puts output
  end
end
