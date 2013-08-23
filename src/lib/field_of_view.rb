module RubyTrace
  class FieldOfView
    attr_reader :x, :y, :width, :height
    def initialize(x = -320, y = -240, width = 640, height = 480)
      @x = x
      @y = y
      @width = width
      @height = height
    end
  end
end