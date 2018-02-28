# frozen_string_literal: true

require_relative '../../lib/gilded_rose.rb'

describe ItemStatic do
  context 'Sulfuras, Hand of Ragnaros' do
    subject(:sulfuras) { described_class.new('Sulfuras, Hand of Ragnaros', 0, 80) }

    it 'expect Sulfuras, Hand of Ragnaros to not change even when conjured' do
      sulfuras.conjured
      expect(sulfuras.quality).to eq 80
    end
  end
end
