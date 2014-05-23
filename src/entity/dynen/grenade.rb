class Grenade < Dynen

  def create(x,y)
    self.sprite="grenade.png"
    super(x,y,sprite.width,sprite.height,10)
  end

  def update
  end

  def draw
    render
  end
end
