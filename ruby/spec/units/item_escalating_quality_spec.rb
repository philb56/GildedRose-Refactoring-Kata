# frozen_string_literal: true

require_relative '../../lib/gilded_rose.rb'

describe ItemEscalatingQuality do
  context 'Quality increases by twice normal when conjured' do
    it 'Quality increases by 2 > 10 days' do
      backstage = described_class.new('Backstage passes to a TAFKAL80ETC concert', 15, 0)
      backstage.conjured
      backstage.upgrade_quality
      expect(backstage.quality).to eq 2
    end
    it 'Quality increases by 4 > 5 days' do
      backstage = described_class.new('Backstage passes to a TAFKAL80ETC concert', 10, 0)
      backstage.conjured
      backstage.upgrade_quality
      expect(backstage.quality).to eq 4
    end
    it 'Quality increases by 6 > 0 days' do
      backstage = described_class.new('Backstage passes to a TAFKAL80ETC concert', 5, 0)
      backstage.conjured
      backstage.upgrade_quality
      expect(backstage.quality).to eq 6
    end
  end
end
