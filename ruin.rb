require "gosu"
require "chipmunk"
require "pry"



class Ruin < Gosu::Window

  attr_accessor :x, :y

  def initialize width, height
    super width, height, false
    @x = 0
    @y = 0
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @entities = []
    @space = CP::Space.new
    @space.damping = 0.8

    @color = Gosu::Color.new(0xFF00FFFF)
    @width = width
    @height = height
    self.caption = "Ruin"
    @man = Gosu::Image.new(self, "img/man.png", true)
  end

  def addEntity(name,*params)
    ent = name.new(self)
    ent.create(*params)
    @entities << ent
  end

  def update
    @entities.each {|e| e.update}
  end

  def draw
    draw_quad(0,0,@color, @width,0,@color, 0,@height,@color, @width,@height,@color, 0)
    @font.draw("FPS: #{Gosu.fps}",10,10,10,1,1,0xffffff00)
    @entities.each {|e| e.draw}
  end

end

class Entity
  attr_accessor :x, :y
  attr_reader :ruin
  def initialize(game)
    @sprite = nil
    @ruin = game
    @x = 0
    @y = 0
  end

  def create
  end

  def update
  end
  
  def draw
  end

  def _x
    @x - @ruin.x
  end

  def _y
    @y - @ruin.y
  end

  def sprite=


end

class Sprite < Gosu::Image

  def +

end

class Player < Entity

  def create(x, y)
    @sprite = Gosu::Image.new(@ruin, "img/man.png", true)
  end

class Map < Entity

  def create(width, height)
    @sprite = Gosu::Image.new(@ruin, "img/dirt.png", true)
    @width = width
    @height = height
    @tiles = [[1]*width]*height
  end

  def update
    ruin.x += 1 if ruin.button_down? Gosu::KbD
    ruin.x -= 1 if ruin.button_down? Gosu::KbA
    ruin.y += 1 if ruin.button_down? Gosu::KbS
    ruin.y -= 1 if ruin.button_down? Gosu::KbW
  end

  def draw
    @width.times do |w|
      @height.times do |h|
        @sprite.draw(_x + w*16, _y + h*16, 0) if @tiles[w,h]
      end
    end
  end
end

r = Ruin.new 640, 480
r.addEntity(Map, 10, 10)
r.show




