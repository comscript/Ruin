module Gosu
  class << self
    alias_method :_fps, :fps
    def fps
      _fps == 0 ? 60 : _fps
    end
  end
end
