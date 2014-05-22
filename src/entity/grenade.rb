class Grenade < CPEntity

  def create(x,y)
    super(10, CP::moment_for_circle(10,0,8,CP::Vec2.new(0,0)), x, y)
    self.sprite="grenade.png" 
  end

  def update
  end

  def draw
    render
  end
end
