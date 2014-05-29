class Map < Staten

  def create(x, y, w, h)
    self.simulate(x, y, w, h)
    self.x = x
    self.y = y
    self.sprite = "dirt.png"
    @w = w
    @h = h
    gen = Perlin::Generator.new 123, 3.0, 3
    @blocks = gen.chunk(0,0,w,h,1).each do |row|
      row.map!{|b| (b > -0.3)?0:nil}
    end
    @block_size = 16
  end

  def update
    ruin.x += 4 if ruin.button_down? Gosu::KbRight
    ruin.x -= 4 if ruin.button_down? Gosu::KbLeft
    ruin.y += 4 if ruin.button_down? Gosu::KbDown
    ruin.y -= 4 if ruin.button_down? Gosu::KbUp
  end

  def draw
    (ruin.w/16+2).times do |i|
      (ruin.h/16+2).times do |j|
        r = i - 1
        c = j - 1
        if block(-(_x / 16)+r,-(_y / 16)+c)
          sprite.draw(_x%16 + r*16, _y%16 + c*16, 0)
        end
      end
    end
  end

  def block(x,y)
    return nil if x < 0 or y < 0
    return nil unless @blocks[x]
    return @blocks[x][y]
  end

end


