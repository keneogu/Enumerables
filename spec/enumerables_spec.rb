require_relative '../enumerable'

describe Enumerable do
  describe '#my_each' do
    let(:arr) { [1, 2, 3] }
    let(:range) { (1..5) }

    it 'returns the same array' do
      expect(arr.my_each { |item| item }).to eql(arr)
    end

    it 'return a range' do
      expect(range.my_each { |item| item }).to be range
    end

    it 'returns false if not the same array' do
      expect(arr.my_each { |item| item }).not_to eql([1, 2, 3, 4])
    end
  end
end
