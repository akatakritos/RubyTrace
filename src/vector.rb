module RubyTrace
  class Vector
    attr_reader :x, :y, :z
    def initialize(x=0,y=0,z=0)
      @x = x
      @y = y
      @z = z
    end

    def add(other)
      Vector.new( @x + other.x, @y + other.y, @z + other.z)
    end
    alias_method :"+", :add

    def sub(other)
      Vector.new(@x - other.x, @y - other.y, @z - other.z)
    end
    alias_method :"-", :sub

    def mult(scalar)
      Vector.new(@x * scalar, @y * scalar, @z * scalar)
    end
    alias_method :"*", :mult

    def magnitude
      Math.sqrt(@x**2 + @y**2 + @z**2)
    end

    def dot(other)
      @x * other.x + @y * other.y + @z * other.z
    end

    def eql?(other)
      self == (other)
    end

    def ==(other)
      @x == other.x && @y == other.y && @z == other.z
    end

    def hash
      @x ^ @y ^ @z
    end

    def normalize
      self * (1 / self.magnitude)
    end

    def angle(other)
      dot = self.normalize.dot(other.normalize)
      Math.acos(dot)
    end

    ZERO = Vector.new
  end
end