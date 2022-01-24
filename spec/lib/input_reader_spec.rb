require_relative '../spec_helper'
require_relative '../../lib/input_reader'

describe InputReader do
  describe '#read' do
    let(:path) { File.join(File.dirname(__FILE__), '../data/single_item.csv') }
    let(:reader) { InputReader.new(path) }
    subject { reader.read }

    specify do
      expect(subject.length).to eq(1)
      expect(subject[0].quantity).to eq(1)
      expect(subject[0].name).to eq('book')
      expect(subject[0].price).to eq(12.49)
    end
  end
end
