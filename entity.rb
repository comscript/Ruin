class Entity

  attr_accessor :x, :y
  attr_reader :ruin

  def initialize(ruin)
    @sprite = nil
    @ruin = ruin
    @x = 0
    @y = 0
  end

  def _x
    @x - @ruin.x
  end

  def _y
    @y - @ruin.y
  end

  def sprite=(path, tileable=true)
    @sprite = Gosu::Image.new(@ruin, "img/#{path}", tileable)
  end

  def sprite
    @sprite
  end

  def render
    @sprite.draw(_x,_y,0)
  end

  def create
  end

  def update
  end

  def draw
  end

end
