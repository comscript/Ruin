class Dynen < Entity

  def create(m, i, x, y)
    @body = CP::Body.new(m,i)
    @body.p = CP::Vec2.new(x,y)
    @ruin.addBody(@body)
  end

  def _x
    @body.p.x - @ruin.x
  end

  def _y
    @body.p.y - @ruin.y
  end
end
