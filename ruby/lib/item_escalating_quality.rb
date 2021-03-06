# frozen_string_literal: true

class ItemEscalatingQuality < ItemGeneralCase
  def quality_increment
    return 1 * conjure_factor if @sell_in > 10
    return 2 * conjure_factor if @sell_in > 5
    return 3 * conjure_factor if @sell_in.positive?
    0
  end

  def upgrade_quality
    @quality += quality_increment unless @quality >= 50
    @quality = 50 if @quality > 50
    @quality = 0 if @sell_in <= 0
  end
end
