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

  describe '#my_each_with_index' do
    let(:range) { (1..5) }
    let(:arr) { %w[Sharon Leo Leila Brian Arun] }
    it 'should return the range of numbers' do
      result = []
      arr.my_each_with_index { |value, idx| result << value if idx.even? }
      expect(result).to eql(%w[Sharon Leila Arun])
    end

    it 'should return the index of a range' do
      expect(range.my_each_with_index { |_v, i| i }).to match_array([1, 2, 3, 4, 5])
    end
  end
end
