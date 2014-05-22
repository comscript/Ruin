class Grenade < Entity

  def create(x,y)
    self.sprite= "grenade.png"
    self.x = x
    self.y = y
  end

  def update
  end

  def draw
    render
  end
end
