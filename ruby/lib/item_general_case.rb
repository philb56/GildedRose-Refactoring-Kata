class ItemGeneralCase < Item
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
    @sell_in <= 0 ? 2 : 1
  end
end
