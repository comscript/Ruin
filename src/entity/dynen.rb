class Dynen < Entity

  def create(m, i, x, y)
    @body = CP::Body.new(m,i)
    @body.p = CP::Vec2.new(x,y)
    @ruin.addBody(@body)
  end

  def x
    @body.p.x
  end

  def y
    @body.p.y
  end
end
