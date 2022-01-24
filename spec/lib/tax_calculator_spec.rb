require_relative '../spec_helper'
require_relative '../../lib/tax_calculator'

describe TaxCalculator do
  describe '#item_tax_rate' do
    let(:item) { ReceiptLineItem.new(1, name, 1) }
    let(:calculator) { TaxCalculator.new }
    subject { calculator.item_tax_rate(item) }

    context 'when apply both basic sales tax and import duty' do
      let(:name) { 'imported perfume' }

      it { is_expected.to eq(10 / 100.0 + 5 / 100.0) }
    end

    context 'when apply only basic sales tax' do
      let(:name) { 'music cd' }

      it { is_expected.to eq(10 / 100.0) }
    end

    context 'when apply only import duty' do
      let(:name) { 'imported chocolate' }

      it { is_expected.to eq(5 / 100.0) }
    end

    context 'when tax free' do
      let(:name) { 'book' }

      it { is_expected.to eq(0) }
    end
  end
end
