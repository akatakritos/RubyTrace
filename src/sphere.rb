module RubyTrace
  class Sphere

    attr_accessor :x,:y,:z,:r,:color
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
      @color = color or BasicColor.new(1,0,0)
    end

    def intersection(eye_position, ray_vector)
      ray_vector = ray_vector.normalize unless ray_vector.normalized

      e0 = eye_position - self
      v = e0.dot(ray_vector)
      disc = @r**2 - (e0.dot(e0) - v*v)

      eye_position.translate(ray_vector * (v -Math.sqrt(disc))) unless disc < 0
    end
  end
end
