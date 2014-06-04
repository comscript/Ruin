class Thing

  class << self
    attr_accessor :things
  end

  def initialize(ruin)
    @ruin = ruin
    @things = []
    self.class.things.each do |thing|
      @things << thing.new
    end
  end

  def _update
    update
  end

  def _draw
    draw
  end

  def update
  end

  def draw
  end

  def self.is thing
    self.things ||= []
    things << thing
  end

end
