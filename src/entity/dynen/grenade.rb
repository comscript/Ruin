class Grenade < Dynen

  def create(x, y)
    self.simulate(10, 16, 16)
    self.sprite = "grenade.png"
    self.x = x
    self.y = y
  end

  def update
  end

  def draw
    render
  end
end
