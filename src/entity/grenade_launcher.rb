class GrenadeLauncher < Entity
  def update
    if ruin.button_down? Gosu::MsLeft
      ruin.addEntity(Grenade, ruin.ms_x, ruin.ms_y)
    end
  end
end
