# frozen_string_literal: true

class ItemIncreasingQuality < ItemGeneralCase
  def upgrade_quality
    @quality += quality_increment unless @quality >= 50
    @quality = 50 if @quality > 50
  end
end
