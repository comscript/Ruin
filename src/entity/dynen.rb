class Dynen < Entity

  def create(x, y, mass, moment_of_i)
    @body = CP::Body.new(mass, moment_of_i)
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
