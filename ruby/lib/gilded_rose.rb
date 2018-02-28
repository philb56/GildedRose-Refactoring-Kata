# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'item')
require File.join(File.dirname(__FILE__), 'item_general_case')
require File.join(File.dirname(__FILE__), 'item_static')
require File.join(File.dirname(__FILE__), 'item_increasing_quality')
require File.join(File.dirname(__FILE__), 'item_escalating_quality')
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each(&:upgrade)
  end
end
