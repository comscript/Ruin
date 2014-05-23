class Dynen < Entity
  
  def initialize(ruin)
    super(ruin)
    @w = 1
    @h = 1
    @body = CP::Body.new(1, CP::moment_for_box(1,@w,@h))
    @body.p = CP::Vec2.new(@x,@y)
    ruin.addBody(@body)
  end

  def x
    @body.p.x
  end

  def y
    @body.p.y
  end

  def x=(x)
    @body.p.x = x
  end

  def y=(y)
    @body.p.y = y
  end

  def mass
    @body.m
  end

  def mass=(mass)
    @body.m = mass
    update_moment
  end

  def w=(w)
    super(w)
    update_moment
  end

  def h=(h)
    super(h)
    update_moment
  end

  def update_moment
    @body.i = CP::moment_for_box(mass,w,h)
  end
end
