require_relative '../gilded_rose.rb'

describe Item do

  context "general cases using +5 Dexterity West" do
    
    subject(:plus5DexterityVest) { described_class.new(name="+5 Dexterity Vest", sell_in=10, quality=20) }
    let :items { [plus5DexterityVest] }
    let :gilded_rose { GildedRose.new items }

    it 'expect item to be instantiated correctly' do
      expect(plus5DexterityVest.name).to eq '+5 Dexterity Vest'
      expect(plus5DexterityVest.sell_in).to eq 10
      expect(plus5DexterityVest.quality).to eq 20
    end

    it 'expect +5 Dexterity Vest to be OK after 1st update' do
      gilded_rose.update_quality
      expect(plus5DexterityVest.sell_in).to eq 9
      expect(plus5DexterityVest.quality).to eq 19
    end
    it 'expect +5 Dexterity Vest to be OK after 2nd update' do
      2.times{gilded_rose.update_quality}
      expect(plus5DexterityVest.sell_in).to eq 8
      expect(plus5DexterityVest.quality).to eq 18
    end

    it 'expect +5 Dexterity Vest to be OK after 2nd update' do
      2.times{gilded_rose.update_quality}
      expect(plus5DexterityVest.sell_in).to eq 8
      expect(plus5DexterityVest.quality).to eq 18
    end

    it 'expect +5 Dexterity Vest to be OK after 10th update' do
      10.times{gilded_rose.update_quality}
      expect(plus5DexterityVest.sell_in).to eq 0
      expect(plus5DexterityVest.quality).to eq 10
    end

    it 'expect +5 Dexterity Vest to be OK after 11th update' do
      11.times{gilded_rose.update_quality}
      expect(plus5DexterityVest.sell_in).to eq -1
      expect(plus5DexterityVest.quality).to eq 8
    end

    it 'expect +5 Dexterity Vest quality not to be 0' do
      15.times{gilded_rose.update_quality}
      expect(plus5DexterityVest.sell_in).to eq -5
      expect(plus5DexterityVest.quality).to eq 0
    end
    it 'expect +5 Dexterity Vest quality not to go -ve' do
      16.times{gilded_rose.update_quality}
      expect(plus5DexterityVest.sell_in).to eq -6
      expect(plus5DexterityVest.quality).to eq 0
    end
  end
end
# -------- day 0 --------
# name, sellIn, quality
# +5 Dexterity Vest, 10, 20
# Aged Brie, 2, 0
#
# Elixir of the Mongoose, 5, 7
# Sulfuras, Hand of Ragnaros, 0, 80
# Sulfuras, Hand of Ragnaros, -1, 80
# Backstage passes to a TAFKAL80ETC concert, 15, 20
# Backstage passes to a TAFKAL80ETC concert, 10, 49
# Backstage passes to a TAFKAL80ETC concert, 5, 49
# Conjured Mana Cake, 3, 6
#
# -------- day 1 --------
# name, sellIn, quality
# +5 Dexterity Vest, 9, 19
#
# Aged Brie, 1, 1
# Elixir of the Mongoose, 4, 6
# Sulfuras, Hand of Ragnaros, 0, 80
# Sulfuras, Hand of Ragnaros, -1, 80
# Backstage passes to a TAFKAL80ETC concert, 14, 21
# Backstage passes to a TAFKAL80ETC concert, 9, 50
# Backstage passes to a TAFKAL80ETC concert, 4, 50
# Conjured Mana Cake, 2, 5
#
#
#
