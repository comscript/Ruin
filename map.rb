class Map < Entity

  def create(width, height)
    self.sprite = "dirt.png"
    @width = width
    @height = height
    @tiles = [[1]*width]*height
    @tile_size = 16
  end

  def update
    ruin.x += 4 if ruin.button_down? Gosu::KbD
    ruin.x -= 4 if ruin.button_down? Gosu::KbA
    ruin.y += 4 if ruin.button_down? Gosu::KbS
    ruin.y -= 4 if ruin.button_down? Gosu::KbW
  end

  def draw
    (ruin.h/16).times do |v|
      if @tiles[_x / 16][v - (_y / 16)]
        ruin.print("#{_x / 16},#{(_y / 16) + v}",_x,_y+(v*16))
      end
    end
  end

end


