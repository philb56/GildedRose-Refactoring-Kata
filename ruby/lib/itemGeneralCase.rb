class ItemGeneralCase < Item
  def upgrade_sellin
    @sell_in -= 1
  end

  def upgrade_quality
    @quality -= (@sell_in <= 0 ? 2 : 1 ) if @quality > 0
    @quality = 0 if @quality < 0 
  end

  def upgrade
    upgrade_quality
    upgrade_sellin
  end
end
