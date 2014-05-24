class PlayerSpawner < Entity
  def draw
	ruin.addEntity(Player, 160, 160)
  end
end