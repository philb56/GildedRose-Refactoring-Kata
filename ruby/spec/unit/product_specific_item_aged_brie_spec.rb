require_relative '../../lib/gilded_rose.rb'

describe ItemIncreasingQuality do

  context "general cases using Aged Brie" do
    subject(:agedBrie) { described_class.new(name="Aged Brie", sell_in=2, quality=0) }
    let :items { [agedBrie] }
    let :gilded_rose { GildedRose.new items }

    it 'expect sell_in/quality to be 1/1 after 1st update' do
      gilded_rose.update_quality
      expect(agedBrie.sell_in).to eq 1
      expect(agedBrie.quality).to eq 1
    end

    it 'expect sell_in/quality to be 0/2 after 2nd update' do
      2.times{ gilded_rose.update_quality }
      expect(agedBrie.sell_in).to eq 0
      expect(agedBrie.quality).to eq 2
    end

    it 'expect quality to degrade twice as quickly once sell_in zeroes' do
      3.times{ gilded_rose.update_quality }
      expect(agedBrie.sell_in).to eq -1
      expect(agedBrie.quality).to eq 4
    end

    it 'expect sell_in/quality to be -23/50 after 25th update' do
      26.times{ gilded_rose.update_quality }
      expect(agedBrie.sell_in).to eq -24
      expect(agedBrie.quality).to eq 50
    end

    it 'expect quality to remain static after reaching 50' do
      27.times{ gilded_rose.update_quality }
      expect(agedBrie.sell_in).to eq -25
      expect(agedBrie.quality).to eq 50
    end

  end
  context "general cases using Aged Brie - edge case" do
    subject(:agedBrie) { described_class.new(name="Aged Brie", sell_in=0, quality=49) }
    let :items { [agedBrie] }
    let :gilded_rose { GildedRose.new items }

    it 'expect quality to be capped at 50' do
      gilded_rose.update_quality
      expect(agedBrie.sell_in).to eq -1
      expect(agedBrie.quality).to eq 50
    end
  end
end
