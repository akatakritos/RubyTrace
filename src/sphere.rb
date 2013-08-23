module RubyTracer
  class Sphere

    def initialize(*args)
      if args.length == 5
        x = args[0]
        y = args[1]
        z = args[2]
        r = args[3]
        color = args[4]
      elsif args.length == 1
        x = args[0][:x]
        y = args[0][:y]
        z = args[0][:z]
        r = args[0][:r]
        color = args[0][:color]
      end

      @x = x or 0
      @y = y or 0
      @z = z or 0
      @r = r or 1
      @color = color or Color.new(255,0,0)
    end
  end
end
