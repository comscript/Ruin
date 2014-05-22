class Grenade < Entity
  
  def initialize(ruin)
    super(ruin)
    self.sprite=("grenade.png")
  end

  def create
  end

  def update
  end

  def draw
    render
  end
end
