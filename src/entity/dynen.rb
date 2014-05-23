class Dynen < Entity

  def create(x, y, width, height, mass)
    @body = CP::Body.new(mass, CP::moment_for_box(mass,width,height))
    @body.p = CP::Vec2.new(x,y)
    @ruin.addBody(@body)
  end

  def x
    @body.p.x
  end

  def y
    @body.p.y
  end

  def mass
    @body.m
  end
end
