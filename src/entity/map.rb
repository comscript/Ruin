class Map < Entity

  def create(width, height)
    setAnimationFromSheet("grass_tilemap.png",16,16,0)
    @width = width
    @height = height
    self.y = 256
    gen = Perlin::Generator.new 123, 3.0, 3
    @blocks = gen.chunk(0,0,width,height,1).each do |row|
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
        current_x = -(_x / 16) + r
        current_y = -(_y / 16) + c
        if block(current_x,current_y)
          adjacent = 0
          adjacent |= 0x8 if block(current_x, current_y-1)
          adjacent |= 0x4 if block(current_x + 1, current_y)
          adjacent |= 0x2 if block(current_x, current_y + 1)
          adjacent |= 0x1 if block(current_x - 1, current_y)
          @animation_index = adjacent
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


