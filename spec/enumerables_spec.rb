RSpec.describe Enumerable do
  describe "my_each" do
    it 'returns an array with the items + 1' do
      expect([1, 2, 3].my_each{ |item| item + 1 }).to eql([1, 2, 3])
    end
  end
  describe "my_select" do
    it 'returns an array with the items > 3' do
      expect([1, 2, 3, 7, 5].my_select{ |item| item > 3 }).to eql([7, 5])
    end
  end
end
