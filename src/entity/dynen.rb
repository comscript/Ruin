class Dynen < Entity

  def create(x, y, mass, sprite_path)
    self.sprite=sprite_path
    @body = CP::Body.new(mass, CP::moment_for_box(mass,@w,@h))
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
  def mass=(mass)
    @body.m = mass
    update_moment
  end
  def w=(w)
    @w=w
    update_moment
  end
  def h=(h)
    @h=h
    update_moment
  end
  def update_moment
    @body.i = CP::moment_for_box(@body.m,@w,@h)
  end
end
