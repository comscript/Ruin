class Grenade < Dynen

  def create(new_x, new_y)
    self.x = new_x
    self.y = new_y
    mass = 10
    self.sprite= "grenade.png"
  end

  def update
  end

  def draw
    render
  end
end
