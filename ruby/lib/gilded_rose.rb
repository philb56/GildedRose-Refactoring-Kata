require File.join(File.dirname(__FILE__), 'item')
require File.join(File.dirname(__FILE__), 'itemGeneralCase')
require File.join(File.dirname(__FILE__), 'itemStatic')
require File.join(File.dirname(__FILE__), 'itemIncreasingQuality')
require File.join(File.dirname(__FILE__), 'itemEscalatingQuality')

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each { |item| item.upgrade }
  end
end
