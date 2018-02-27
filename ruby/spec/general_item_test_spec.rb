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
      2.times{ gilded_rose.update_quality }
      expect(plus5DexterityVest.sell_in).to eq 8
      expect(plus5DexterityVest.quality).to eq 18
    end

    it 'expect +5 Dexterity Vest to be OK after 2nd update' do
      2.times{ gilded_rose.update_quality }
      expect(plus5DexterityVest.sell_in).to eq 8
      expect(plus5DexterityVest.quality).to eq 18
    end

    it 'expect +5 Dexterity Vest to be OK after 10th update' do
      10.times{ gilded_rose.update_quality }
      expect(plus5DexterityVest.sell_in).to eq 0
      expect(plus5DexterityVest.quality).to eq 10
    end

    it 'expect +5 Dexterity Vest to be OK after 11th update' do
      11.times{ gilded_rose.update_quality }
      expect(plus5DexterityVest.sell_in).to eq -1
      expect(plus5DexterityVest.quality).to eq 8
    end

    it 'expect +5 Dexterity Vest quality not to be 0' do
      15.times{ gilded_rose.update_quality }
      expect(plus5DexterityVest.sell_in).to eq -5
      expect(plus5DexterityVest.quality).to eq 0
    end
    it 'expect +5 Dexterity Vest quality not to go -ve' do
      16.times{ gilded_rose.update_quality }
      expect(plus5DexterityVest.sell_in).to eq -6
      expect(plus5DexterityVest.quality).to eq 0
    end
  end

end
