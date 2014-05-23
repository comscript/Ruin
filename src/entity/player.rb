class Player < Entity

  def create(x,y)
    self.sprite= "player.png"
    self.x = x
    self.y = y
  end

  def update
    self.x -= 4 if ruin.button_down? Gosu::KbA
    self.x += 4 if ruin.button_down? Gosu::KbD
    self.y -= 4 if ruin.button_down? Gosu::KbW
    self.y += 4 if ruin.button_down? Gosu::KbS
  end

  def draw
    render
  end
end
