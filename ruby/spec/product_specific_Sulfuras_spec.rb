require_relative '../lib/gilded_rose.rb'

describe Item do
  context "Sulfuras, Hand of Ragnaros" do
    subject(:sulfuras) { described_class.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80) }
    let :items { [sulfuras] }
    let :gilded_rose { GildedRose.new items }

    it 'expect Sulfuras, Hand of Ragnaros to not change after 1st update' do
      gilded_rose.update_quality
      expect(sulfuras.sell_in).to eq 0
      expect(sulfuras.quality).to eq 80
    end

    it 'expect Sulfuras, Hand of Ragnaros to not change after 25th update' do
      2.times{ gilded_rose.update_quality }
      expect(sulfuras.sell_in).to eq 0
      expect(sulfuras.quality).to eq 80
    end
  end
end
