class Entity

  attr_accessor :x, :y, :w, :h, :animation_speed, :animation_index
  attr_reader :ruin

  def initialize(ruin)
    @animation = []
    @animation_speed = 1
    @animation_index = 0
    @ruin = ruin
    @x = 0
    @y = 0
    @w = 0
    @h = 0
  end

  def _x
    x - ruin.x
  end

  def _y
    y - ruin.y
  end

  def setAnimation(path, animation_speed=1, tileable=true, autosize=true)
    self.animation_speed = animation_speed
    if File.directory?("img/#{path}") 
      images = Dir["img/#{path}/*"].sort
      images.each do |image|
        @animation << Gosu::Image.new(ruin, image, tileable)
      end
    else
      @animation << Gosu::Image.new(ruin, "img/#{path}", tileable)
    end
    if autosize
      w = @animation[0].width
      h = @animation[0].height
    end
  end
  alias_method :setSprite, :setAnimation
  def setAnimationFromSheet(path, width, height, 
                            animation_speed=1, tileable=true, autosize=true)
    self.animation_speed = animation_speed
    @animation = Gosu::Image::load_tiles(ruin, "img/#{path}", width, height, tileable)
    if autosize
      w = @animation[0].width
      h = @animation[0].height
    end
  end
    
  def animation=(path)
    setAnimation(path)
  end
  alias_method :sprite=, :animation=

  def animation
    @animation
  end

  def sprite
    @animation[@animation_index]
  end

  def render
    sprite.draw(_x,_y,0)
  end

  def animate
    self.animation_index += animation_speed
    self.animation_index = 0 if animation_index >= animation.count
  end

  def _update
    animate
    update
  end

  def update
  end

  def _draw
    draw
  end

  def draw
  end

  def create
  end

end
