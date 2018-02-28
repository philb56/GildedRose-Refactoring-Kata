# frozen_string_literal: true

class ItemGeneralCase < Item
  def conjured
    @conjured = true
  end

  def conjure_factor(sell_in = 1)
    sell_in *= 2 if @conjured
    sell_in
  end

  def upgrade_sellin
    @sell_in -= 1
  end

  def upgrade_quality
    @quality -= quality_increment if @quality.positive?
    @quality = 0 if @quality.negative?
  end

  def upgrade
    upgrade_quality
    upgrade_sellin
  end

  private

  def quality_increment
    @sell_in <= 0 ? conjure_factor(2) : conjure_factor
  end
end
