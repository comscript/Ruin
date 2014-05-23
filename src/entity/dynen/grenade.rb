class Grenade < Dynen

  def create(x,y)
    super(x,y,10, CP::moment_for_circle(10,0,8,CP::Vec2.new(0,0)))
    self.sprite="grenade.png" 
  end

  def update
    puts mass
    mass=(self.mass + 1)
  end

  def draw
    render
  end
end
