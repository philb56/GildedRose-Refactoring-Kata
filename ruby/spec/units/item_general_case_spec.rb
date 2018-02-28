# frozen_string_literal: true

require_relative '../../lib/gilded_rose.rb'
describe ItemGeneralCase do
  context 'general cases for conjured using +5 Dexterity West' do
    subject(:plus5DexterityVest) { described_class.new('+5 Dexterity Vest', 10, 20) }
    subject(:plus5DexterityVest2) { described_class.new('+5 Dexterity Vest', 0, 20) }

    it 'expect conjure_factor to return 1' do
      expect(plus5DexterityVest.conjure_factor).to eq 1
    end

    it 'expect conjure_factor to return 2' do
      plus5DexterityVest.conjured
      expect(plus5DexterityVest.conjure_factor).to eq 2
    end

    it 'expect conjure_factor to return 4' do
      plus5DexterityVest.conjured
      expect(plus5DexterityVest.conjure_factor(2)).to eq 4
    end

    it 'expect item quality to be decrement by 1 - normal' do
      plus5DexterityVest.upgrade_quality
      expect(plus5DexterityVest.quality).to eq 19
    end
    it 'expect item quality to be decrement by 2 - twice normal' do
      plus5DexterityVest.conjured
      plus5DexterityVest.upgrade_quality
      expect(plus5DexterityVest.quality).to eq 18
    end
    it 'expect item quality to be decrement by 4 - twice normal' do
      plus5DexterityVest2.conjured
      plus5DexterityVest2.upgrade_quality
      expect(plus5DexterityVest2.quality).to eq 16
    end
  end
end
