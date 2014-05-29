class Dynen < Entity

  def simulate(mass, w, h)
    moment_of_inertia = CP::moment_for_box(mass, w, h)
    body = CP::Body.new(mass, moment_of_inertia)
    @shape = CP::Shape::Poly.new(body, square(w, h), vector(0,0))
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

  def render
    sprite.draw_rot(_x,_y,0,@shape.body.angle * (180 / Math::PI))
  end

  def update
  end

  def mass
    @shape.body.m
  end

end
