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

  describe '#my_any?' do
    let(:arr) { [1, 2, 3, 4] }

    it 'checks if any of the number is a negative' do
      expect(arr.my_any? { |num| num.negative? }).to eql(false)
    end

    it 'checks if any of the number is greater than 3' do
      expect(arr.my_any? { |num| num > 3 }).to eql(true)
    end
  end

  describe '#my_none?' do
    it 'should return false if none of the word length is >= 4' do
      expect(%w[ant bear cat].my_none? { |word| word.length >= 4 }).to be false
    end

    it 'Check if none of the items are even' do
      expect([1, 3, 5].my_none?(&:even?)).to eql(true)
    end
  end

  describe '#my_count' do
    it 'counts all the even numbers' do
      expect([1, 2, 3, 4].my_count { |num| num.even? }).to eql(2)
    end

    it 'counts all 3 in the array' do
      expect([3, 2, 3, 4, 5].my_count(3)).to eql(2)
    end
  end

  describe '#my_map' do
    it 'Add 1 to all items' do
      expect([1, 2, 3, 4].my_map { |item| item + 1 }).to eql([2, 3, 4, 5])
    end
    it 'Add Hi to all items' do
      expect(%w[Frank Ben].my_map { |word| word.prepend('Hi ') }).to eql(['Hi Frank', 'Hi Ben'])
    end
  end

  describe '#my_inject' do
    it 'returns sum of item' do
      expect([1, 2, 3, 4].my_inject { |a, b| a + b }).to eql(10)
    end

    it 'returns times two the multiple of the items' do
      expect([1, 2, 3, 4].my_inject(2, :*)).to eql(48)
    end

    it 'should work with block' do
      longest =
        %w[cardiology anatomy neurology].my_inject do |memo, word|
          memo.length > word.length ? memo : word
        end

      expect(longest).to eq('cardiology')
    end
  end
end
