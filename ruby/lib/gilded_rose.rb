require File.join(File.dirname(__FILE__), 'item')
require File.join(File.dirname(__FILE__), 'itemGeneralCase')
require File.join(File.dirname(__FILE__), 'itemStatic')
class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
    if item.is_a?(ItemGeneralCase) || item.is_a?(ItemStatic)
      item.upgrade
    else
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          item.quality = item.quality - 1
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end

      item.sell_in = item.sell_in - 1

      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              item.quality = item.quality - 1
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
      end
    end
  end
end
