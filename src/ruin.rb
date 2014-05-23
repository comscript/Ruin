class Ruin < Gosu::Window

  attr_accessor :x, :y
  attr_reader :w, :h

  def initialize w, h
    super w, h, false
    @x = 0
    @y = 0
    @w = w
    @h = h
    @show_cursor = true
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @entities = []
    @space = CP::Space.new
    @space.damping = 0.8
    @color = Gosu::Color.new(0xFF00FFFF)
    self.caption = "Ruin"
  end

  def addEntity(class_name,*params)
    ent = class_name.new(self)
    ent.create(*params)
    @entities << ent
  end

  def update
    @entities.each {|e| e._update}
  end

  def draw
    draw_quad(0,0,@color, w,0,@color, 0,h,@color, w,h,@color, 0)
    print("FPS: #{Gosu.fps}",10,10)
    @entities.each {|e| e._draw}
  end

  def print(text,x,y,color=0xFFAA0000)
    @font.draw(text,x,y,10,1,1,color)
  end

  def ms_x
    self.mouse_x + @x
  end

  def ms_y
    self.mouse_y + @y
  end

  def _ms_x
    self.mouse_x
  end

  def _ms_y
    self.mouse_y
  end

  def needs_cursor?
    @show_cursor
  end

  def show_cursor(show_cursor)
    @show_cursor = show_cursor
  end

end

