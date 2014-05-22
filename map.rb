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
    (ruin.w/@tile_size).times do |r|
      (ruin.h/@tile_size).times do |c|
        sprite.draw(r*@tile_size -_x % @tile_size, c*@tile_size - _y % @tile_size, 0) if @tiles[r,c]
      end
    end
  end

end


