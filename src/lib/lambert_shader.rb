module RubyTrace
  class LambertShader
    def initialize(ambient_coefficient)
      @ambient_coefficient = ambient_coefficient
    end

    def shade(light_vector, normal_vector, base_color)
      shade = light_vector.dot(normal_vector)
      shade = 0 if shade < 0
      base_color.mult( @ambient_coefficient + (1 - @ambient_coefficient) * shade)
    end
  end
end