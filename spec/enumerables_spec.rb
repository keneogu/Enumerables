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

    it 'works with ranges' do
      expect(range.my_each_with_index { |_v, i| i }).to match_array([1, 2, 3, 4, 5])
    end
  end

  describe 'my_select' do
    let(:arr) { [1, 2, 3, 4, 5, 6] }

    it 'should return even numbers' do
      expect(arr.my_select { |num| num.even? }).to eql([2, 4, 6])
    end

    it 'should return numbers greater than 3' do
      expect(arr.my_select { |num| num > 3 }).to eql([4, 5, 6])
    end
  end

  describe 'my_all?' do
    let(:arr) { [1, 2, 3, 4, 5, 6] }

    it 'should return true if all the numbers are positive' do
      expect(arr.my_all? { |num| num.positive? }).to be true
    end

    it 'checks if all the element in the array is an integer' do
      expect([1, 2i, 'John'].my_all?(Numeric)).to be false
    end
  end
end
