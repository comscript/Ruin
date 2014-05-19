require "gosu"
require "chipmunk"



class Ruin < Gosu::Window

  def initialize width, height
    @entities = []
    @space = CP::Space.new
    @space.damping = 0.8

    @color = Gosu::Color.new(0xFF00FFFF)
    @width = width
    @height = height
    super @width, @height, false
    self.caption = "Ruin"
    @man = Gosu::Image.new(self, "img/man.png", true)
  end

  def addEntity(img_file)
    @entities << Entity.new(self, img_file)
  end

  def update
    @entities.each {|e| e.update}
  end

  def draw
    draw_quad(0,0,@color, @width,0,@color, 0,@height,@color, @width,@height,@color, 0)
    @entities.each {|e| e.draw}
  end

end

class Entity

  def initialize(game, img_file)
    @game = game
    @img = Gosu::Image.new(game, "img/" + img_file, false)
    @x = 0
    @y = 0
  end

  def update
    @x += 4 if @game.button_down? Gosu::KbD
    @x -= 4 if @game.button_down? Gosu::KbA
    @y += 4 if @game.button_down? Gosu::KbS
    @y -= 4 if @game.button_down? Gosu::KbW
  end

  def draw
    @img.draw(@x,@y,0)
  end
  
end

class Block

  def initialize(game)
    @game = game
    @img = Gosu::Image.new(game, "img/dirt.png", true)
    @x = 0
    @y = 0
  end


  
end

r = Ruin.new 640, 480
r.addEntity("man.png")
r.show




