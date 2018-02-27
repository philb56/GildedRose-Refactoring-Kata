# Backstage passes
# increases in Quality as it’s SellIn value approaches;
# Quality increases by 2 when there are 10 days or less
# Quality increases by 3 when there are 5 days or less
# Quality drops to 0 after the concert

require_relative '../lib/gilded_rose.rb'

describe Item do

  context "Quality increases by 1 when there are > 10 days" do
    subject(:backstage) { described_class.new(name="Backstage passes to a TAFKAL80ETC concert",
                          sell_in=15,
                          quality=0) }
    let :items { [backstage] }
    let :gilded_rose { GildedRose.new items }

    it 'expect sell_in/quality to be 14/1 after 1st update' do
      gilded_rose.update_quality
      expect(backstage.sell_in).to eq 14
      expect(backstage.quality).to eq 1
    end
    it 'expect sell_in/quality to be 13/2 after 2nd update' do
      2.times{gilded_rose.update_quality}
      expect(backstage.sell_in).to eq 13
      expect(backstage.quality).to eq 2
    end

    it 'expect sell_in/quality to be 10/5 after 5th update' do
      5.times{gilded_rose.update_quality}
      expect(backstage.sell_in).to eq 10
      expect(backstage.quality).to eq 5
    end
  end
  context "Quality increases by 2 when there are 10 days or less" do
    subject(:backstage) { described_class.new(name="Backstage passes to a TAFKAL80ETC concert",
                          sell_in=10,
                          quality=0) }
    let :items { [backstage] }
    let :gilded_rose { GildedRose.new items }

    it 'expect sell_in/quality to be 9/2 after 1st update' do
      gilded_rose.update_quality
      expect(backstage.sell_in).to eq 9
      expect(backstage.quality).to eq 2
    end
    it 'expect sell_in/quality to be 5/10 after 5th update' do
      5.times{ gilded_rose.update_quality }
      expect(backstage.sell_in).to eq 5
      expect(backstage.quality).to eq 10
    end
  end

  context "Quality increases by 3 when there are 5 days or less" do
    subject(:backstage) { described_class.new(name="Backstage passes to a TAFKAL80ETC concert",
                          sell_in=5,
                          quality=0) }
    let :items { [backstage] }
    let :gilded_rose { GildedRose.new items }

    it 'expect sell_in/quality to be 4/3 after 1st update' do
      gilded_rose.update_quality
      expect(backstage.sell_in).to eq 4
      expect(backstage.quality).to eq 3
    end
    it 'expect sell_in/quality to be 0/15 after 5th update' do
      5.times{ gilded_rose.update_quality }
      expect(backstage.sell_in).to eq 0
      expect(backstage.quality).to eq 15
    end
  end

  context "Quality drops to 0 after the concert" do
    subject(:backstage) { described_class.new(name="Backstage passes to a TAFKAL80ETC concert",
                          sell_in=1,
                          quality=4) }
    let :items { [backstage] }
    let :gilded_rose { GildedRose.new items }

    it 'expect sell_in/quality to be 0/0 after 1st update' do
      gilded_rose.update_quality
      expect(backstage.sell_in).to eq 0
      expect(backstage.quality).to eq 7
    end
    it 'expect sell_in/quality to be -1/0 after 5th update' do
      2.times{ gilded_rose.update_quality }
      expect(backstage.sell_in).to eq -1
      expect(backstage.quality).to eq 0
    end
  end
end
