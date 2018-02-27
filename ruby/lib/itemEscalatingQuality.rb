class ItemEscalatingQuality < ItemGeneralCase
  def quality_increment
    return 1 if @sell_in > 10
    return 2 if @sell_in > 5
    return 3 if @sell_in > 0
    return 0
  end

  def upgrade_quality
    @quality += quality_increment unless @quality >= 50
    @quality = 50 if @quality > 50
    @quality = 0 if @sell_in <= 0
  end
end
