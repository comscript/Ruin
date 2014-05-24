class Player < Dynen

  def create(new_x, new_y)
    self.x = new_x
    self.y = new_y
    mass = 100
    self.sprite= "player.png"
    @body.v = CP::Vec2.new(0,0)
  end

  def update
    move_left(50) if ruin.button_down? Gosu::KbA
    move_right(50) if ruin.button_down? Gosu::KbD
    jump if ruin.button_down? Gosu::KbW
  end

  def move_left(speed)
    @body.v.x = -speed
  end

  def move_right(speed)
    @body.v.x = speed
  end

  def jump
    @body.v.y = 100
  end

  def draw
    render
  end
end
