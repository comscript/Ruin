class Map < Entity

  def create(width, height)
    setAnimation("grass", 0)
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
          #BEGINNING OF NEW CODE
          adjacent = 0
          adjacent |= 0x80 if block(current_x - 1, current_y - 1)
          adjacent |= 0x40 if block(current_x, current_y-1)
          adjacent |= 0x20 if block(current_x + 1, current_y - 1)
          adjacent |= 0x10 if block(current_x - 1, current_y)
          adjacent |= 0x08 if block(current_x + 1, current_y)
          adjacent |= 0x04 if block(current_x - 1, current_y + 1)
          adjacent |= 0x02 if block(current_x, current_y + 1)
          adjacent |= 0x01 if block(current_x + 1, current_y + 1)
          if ~adjacent&0x50 == 0x50 then @animation_index = 0
          elsif ((~adjacent&0x40) | (adjacent&0x18)) == (0x40|0x18) then @animation_index = 1
          elsif ~adjacent&0x48 == 0x48 then @animation_index = 2
          elsif ((~adjacent&0x10) | (adjacent&0x42)) == (0x10|0x42) then @animation_index = 3
          elsif adjacent&0x5A == 0x5A then @animation_index = 4
          elsif ((~adjacent&0x08) | (adjacent&0x42)) == (0x08|0x42) then @animation_index = 5
          elsif ~adjacent&0x12 == 0x12 then @animation_index = 6
          elsif ((~adjacent&0x02) | (adjacent&0x18)) == (0x02|0x18) then @animation_index = 7
          elsif ~adjacent&0x0A == 0x0A then @animation_index = 8
          else @animation_index = 9 end
          #END OF NEW CODE
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


