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
    @body.i = CP::moment_for_box(mass,@w,@h)
  end
end
