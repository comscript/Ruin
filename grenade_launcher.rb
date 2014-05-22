class GrenadeLauncher < Entity
  def update
    if ruin.button_down? Gosu::MsLeft
      ruin.addEntity(Grenade, ruin._mouse_x, ruin._mouse_y)
    end
  end
end
