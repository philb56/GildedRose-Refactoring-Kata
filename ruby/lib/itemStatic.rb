class ItemStatic < ItemGeneralCase
  def upgrade_sellin
    @sell_in
  end

  def upgrade_quality
    @quality
  end

  def upgrade
    upgrade_quality
    upgrade_sellin
  end
end
