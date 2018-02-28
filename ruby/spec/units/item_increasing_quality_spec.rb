# frozen_string_literal: true

require_relative '../../lib/gilded_rose.rb'

describe ItemIncreasingQuality do
  context 'Quality increases by twice normal when conjured' do
    it 'Quality increases by 2 days' do
      agedBrie = described_class.new('Aged Brie', 1, 0)
      agedBrie.conjured
      agedBrie.upgrade_quality
      expect(agedBrie.quality).to eq 2
    end
    it 'Quality increases by 4' do
      agedBrie = described_class.new('Aged Brie', 0, 0)
      agedBrie.conjured
      agedBrie.upgrade_quality
      expect(agedBrie.quality).to eq 4
    end
  end
end
