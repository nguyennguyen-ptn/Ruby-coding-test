require_relative '../spec_helper'
require_relative '../../lib/input_reader'

describe InputReader do
  describe '#read' do
    let(:path) { File.join(File.dirname(__FILE__), '../inputs/input4.csv') }
    let(:reader) { InputReader.new(path) }
    subject { reader.read }

    specify do
      expect(subject.length).to eq(1)
      expect(subject[0].quantity).to eq(1)
      expect(subject[0].name).to eq('book')
      expect(subject[0].price).to eq(12.49)
    end

    context 'invalid input' do
      let(:path) { File.join(File.dirname(__FILE__), '../inputs/invalid.csv') }

      it { expect { subject }.to raise_error(RuntimeError) }
    end
  end
end
