require_relative '../spec_helper'
require_relative '../../lib/output_builder'
require_relative '../../lib/receipt_line_item'

describe OutputBuilder do
  describe '#build' do
    let(:items) do
      [
        ReceiptLineItem.new(1, 'book', 100),
        ReceiptLineItem.new(1, 'imported book', 100)
      ]
    end
    let(:total) { 205 }
    let(:total_tax) { 5 }
    let(:builder) { OutputBuilder.new(items, total, total_tax) }
    let(:expected_output) { "1, book, 100.00\n1, imported book, 105.00\n\nSales Taxes: 5.00\nTotal: 205.00\n" }

    before do
      items[0].tax = 0
      items[1].tax = 5
    end

    it { expect(builder.build).to eq(expected_output) }
  end
end
