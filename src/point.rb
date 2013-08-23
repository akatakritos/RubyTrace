module RubyTracer
  class Point

    attr_reader :x, :y, :z
    def initialize(x,y,z)
      @x = x
      @y = y
      @z = z
    end

    def translate( vector )
      Point.new (@x + vector.x, @y + vector.y, @z + vector.z)
    end
  end
end