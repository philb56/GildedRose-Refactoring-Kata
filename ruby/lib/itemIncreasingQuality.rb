class ItemIncreasingQuality < ItemGeneralCase
  def upgrade_quality
    @quality += (@sell_in <= 0 ? 2 : 1 ) unless @quality >= 50
    @quality = 50 if @quality > 50 
  end
end
