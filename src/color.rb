module RubyTrace
  class Color
    RED_MASK   = 0xFF000000
    GREEN_MASK  = 0x00FF0000
    BLUE_MASK = 0x0000FF00
    ALPHA_MASK = 0x000000FF

    def initialize(*args)
      throw "THIS NEEDS TO BE 0 to 1; this logic can become a translater"
      if args.length == 1
        @value = args[0]
      elsif args.length == 4
        @value = from_rgba(*args)
      end
    end

    def red
      (@value & RED_MASK) >> 24
    end
    alias_method :r, :red

    def green
      (@value & GREEN_MASK) >> 16
    end
    alias_method :g, :green

    def blue
      (@value & BLUE_MASK) >> 8
    end
    alias_method :b, :blue

    def alpha
      (@value & ALPHA_MASK)
    end
    alias_method :a, :alpha

    def mult
      Color.new(r * scalar, g * scalar, b * scalar, a * scalar)
    end

    def to_s
      '#'+@value.to_s(16).upcase
    end

    private
      def from_rgba(r,g,b,a)
        (r<<24) + (g<<16) + (b<<8) + a
      end
  end
end