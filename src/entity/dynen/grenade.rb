class Grenade < Dynen

  def create(x, y)
    self.simulate(0.1, 16, 16)
    self.sprite = "test.png"
    self.x = x
    self.y = y
  end

  def update
  end

  def draw
    render
  end
end
