module RubyTrace
  class Point
    attr_reader :x, :y, :z
    def initialize(x=0,y=0,z=0)
      @x = x
      @y = y
      @z = z
    end

    def translate(vector)
      Point.new(@x + vector.x, @y + vector.y, @z + vector.z)
    end
    alias_method :add, :translate
    alias_method :'+', :translate

    def sub(other)
      Vector.new(@x - other.x, @y - other.y, @z - other.z)
    end
    alias_method :'-', :sub

    def eql?(other)
      self.equal?(other) || (@x == other.x && @y == other.y && @z == other.z)
    end
    alias_method :'==', :'eql?'

    def hash
      @x.hash ^ @y.hash ^ @z.hash
    end
  end
end