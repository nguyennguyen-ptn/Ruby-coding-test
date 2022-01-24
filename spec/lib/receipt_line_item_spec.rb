require_relative '../spec_helper'
require_relative '../../lib/receipt_line_item'

describe ReceiptLineItem do
  let(:item) { ReceiptLineItem.new(1, name, 1) }

  describe '#exempt?' do
    subject { item.exempt? }

    context 'book' do
      let(:name) { 'book' }

      it { is_expected.to be(true) }
    end

    context 'chocolate' do
      let(:name) { 'chocolate' }

      it { is_expected.to be(true) }
    end

    context 'pill' do
      let(:name) { 'pill' }

      it { is_expected.to be(true) }
    end

    context 'perfume' do
      let(:name) { 'perfume' }

      it { is_expected.to be(false) }
    end
  end

  describe '#imported?' do
    subject { item.imported? }

    context 'when imported' do
      let(:name) { 'imported chocolate' }

      it { is_expected.to be(true) }
    end

    context 'when not imported' do
      let(:name) { 'chocolate' }

      it { is_expected.to be(false) }
    end
  end
end
