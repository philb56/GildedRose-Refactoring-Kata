# frozen_string_literal: true

require_relative '../../lib/gilded_rose.rb'

describe ItemIncreasingQuality do
  context 'Quality increases by twice normal when conjured' do
    it 'Quality increases by 2 days' do
      aged_brie = described_class.new('Aged Brie', 1, 0)
      aged_brie.conjured
      aged_brie.upgrade_quality
      expect(aged_brie.quality).to eq 2
    end
    it 'Quality increases by 4' do
      aged_brie = described_class.new('Aged Brie', 0, 0)
      aged_brie.conjured
      aged_brie.upgrade_quality
      expect(aged_brie.quality).to eq 4
    end
  end
end
