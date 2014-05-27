class Staten < Entity

  def simulate(x, y, w, h)
    body = CP::Body.new_static()
    @shape = CP::Shape::Poly.new(body, square(w, h), vector(0,0))
    @shape.body.p = vector(x,y)
    @shape.e = 0.5
    @shape.u = 0.8
    @shape.collision_type = 1
    ruin.simulate(@shape)
  end

  def x
    @shape.body.p.x
  end

  def y
    @shape.body.p.y
  end

  def x=(x)
    @shape.body.p.x = x
  end

  def y=(y)
    @shape.body.p.y = y
  end

end
