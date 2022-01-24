require_relative './input_reader'
require_relative './tax_calculator'
require_relative './output_builder'
require_relative './exceptions_catcher'

class Application
  def self.run!(path)
    catcher = ExceptionsCatcher.new
    if catcher.is_txt_file?(path) && catcher.right_format?(path)
      items = InputReader.new(path).read
      items, total, total_tax = TaxCalculator.new.calculate(items)
      output = OutputBuilder.new(items, total, total_tax).build
      puts output
    end
  end
end
