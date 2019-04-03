RSpec.describe Enumerable do
  let(:array) { [1, 2, 3] }
  let(:items) { [0, 1, 2] }
  let(:numbers) { [1, 2, 3, 7, 5] }
  let(:example) { [9, 3, 2, 4, 7] }

  describe 'my_each' do
    it 'returns an array with the items + 1' do
      expect(array.my_each { |item| item + 1 }).to eql(array)
    end
  end
  describe 'my_select' do
    it 'returns an array with the items > 3' do
      expect(numbers.my_select { |item| item > 3 }).to eql([7, 5])
    end
  end
  describe 'my_each_with_index' do
    it 'it returns items index' do
      expect(items.my_each_with_index { |_item, index| index }).to eql(items)
    end
  end

  describe 'my_all' do
    it 'checks if all elements fulfill a condition or not' do
      expect(array.my_all? { |item| item.is_a?(Integer) }).to eql(true)
    end
  end

  describe 'my_any' do
    it 'checks if any of the elements fulfill a condition or not' do
      expect([1, 'test', 3].my_any? { |item| item.is_a?(Integer) }).to eql(true)
    end
  end

  describe 'my_none' do
    it 'checks if none of the elements fulfill a condition or not' do
      expect([1, 'test', 3].my_none? { |item| item.is_a?(Integer) }).to eql(false)
    end
  end

  describe 'my_count' do
    it 'checks counts how many of the elements fulfill a condition' do
      expect(%w[alpha beta theta omega a b c].my_count { |word| word.size > 1 }).to eql(4)
    end
  end

  describe 'my_map' do
    it 'checks counts how many of the elements fulfill a condition' do
      expect(example.my_map(&:even?)).to eql([false, false, true, true, false])
    end
  end

  describe 'my_inject' do
    it 'adds all numbers in an array to give out a single number' do
      expect(example.my_inject { |total, n| total * n }).to eql(25)
    end
  end
end
