require_relative '../gilded_rose.rb'

describe Item do
  subject(:item) { described_class.new(name="+5 Dexterity Vest", sell_in=10, quality=20) }
  let :items { [item] }
  let :gilded_rose { GildedRose.new items }

  it 'expect item to be instantiated correctly' do
    expect(item.name).to eq '+5 Dexterity Vest'
    expect(item.sell_in).to eq 10
    expect(item.quality).to eq 20
  end

  it 'expect +5 Dexterity Vest to be quality to be OK after first day update' do
    gilded_rose.update_quality
    expect(item.name).to eq '+5 Dexterity Vest'
    expect(item.sell_in).to eq 9
    expect(item.quality).to eq 19
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
