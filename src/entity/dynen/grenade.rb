class Grenade < Dynen

  def create(x,y)
    super(x,y,10,"grenade.png")
  end

  def update
  end

  def draw
    render
  end
end
