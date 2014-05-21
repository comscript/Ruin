require "gosu"
require "chipmunk"
require "pry"



class Ruin < Gosu::Window

  def initialize width, height
    super width, height, false
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
  def initialize(game)
    @game = game
  end

  def create
  end

  def update
  end
  
  def draw
  end

end

class Map < Entity

  def create(width, height)
    @tile = Gosu::Image.new(@game, "img/dirt.png", true)
    @x = 0
    @y = 0
    @width = width
    @height = height
    @tiles = [[1]*width]*height
  end

  def update
    @x += 1 if @game.button_down? Gosu::KbD
    @x -= 1 if @game.button_down? Gosu::KbA
    @y += 1 if @game.button_down? Gosu::KbS
    @y -= 1 if @game.button_down? Gosu::KbW
  end

  def draw
    @width.times do |w|
      @height.times do |h|
        @tile.draw(@x + w*16, @y + h*16, 0) if @tiles[w,h]
      end
    end
  end
end

r = Ruin.new 640, 480
r.addEntity(Map, 10, 10)
r.show




