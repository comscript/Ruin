class Ruin < Gosu::Window

  attr_accessor :x, :y
  attr_reader :w, :h

  def initialize w, h
    super w, h, false
    @x = 0
    @y = 0
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @entities = []
    @space = CP::Space.new
    @space.damping = 0.8

    @color = Gosu::Color.new(0xFF00FFFF)
    @w = w
    @h = h
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
    draw_quad(0,0,@color, w,0,@color, 0,h,@color, w,h,@color, 0)
    print("FPS: #{Gosu.fps}",10,10)
    @entities.each {|e| e.draw}
  end

  def print(text,x,y,color=0xFFAA0000)
    @font.draw(text,x,y,10,1,1,color)
  end

end

