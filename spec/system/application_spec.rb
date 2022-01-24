require_relative '../spec_helper'
require_relative '../../lib/application'

describe Application do
  describe '#run!' do
    let(:input_path) { File.join(File.dirname(__FILE__), input_file) }
    let(:output_path) { File.join(File.dirname(__FILE__), output_file) }
    let(:expected_output) { File.read(output_path) }
    subject { Application.run!(input_path) }

    context 'input1' do
      let(:input_file) { '../inputs/input1.csv' }
      let(:output_file) { '../inputs/output1.csv' }

      it { expect { subject }.to output(expected_output).to_stdout }
    end

    context 'input2' do
      let(:input_file) { '../inputs/input2.csv' }
      let(:output_file) { '../inputs/output2.csv' }

      it { expect { subject }.to output(expected_output).to_stdout }
    end

    context 'input3' do
      let(:input_file) { '../inputs/input3.csv' }
      let(:output_file) { '../inputs/output3.csv' }

      it { expect { subject }.to output(expected_output).to_stdout }
    end
  end
end
