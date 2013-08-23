module RubyTrace
  class Sphere

    attr_accessor :center,:radius,:color
    def initialize(center = Point.new(0,0,0), radius = 1, color = BasicColor.new(1,0,0))
      @center = center
      @radius = radius
      @color = color
    end

    def intersection(eye_position, ray_vector)
      ray_vector = ray_vector.normalize unless ray_vector.normalized

      e0 = self.center - eye_position
      v = e0.dot(ray_vector)
      disc = @radius**2 - (e0.dot(e0) - v*v)

      eye_position.translate(ray_vector * (v -Math.sqrt(disc))) unless disc < 0
    end

    def normal_vector(surface_point)
      surface_point - @center
    end
  end
end
