class Grenade < CPEntity

  def create(x,y)
    super(10, 150, x, y)
    self.sprite="grenade.png" 
  end

  def update
  end

  def draw
    render
  end
end
