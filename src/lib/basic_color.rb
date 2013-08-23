module RubyTrace
  class BasicColor

    attr_reader :r, :g, :b
    alias_method :red, :r
    alias_method :blue, :b
    alias_method :green, :g
    def initialize(r,g,b)
      @r = r
      @g = g
      @b = b
    end

    def mult(scalar)
      BasicColor.new(@r * scalar, @g * scalar, @b * scalar)
    end
    alias_method :"*", :mult
  end
end