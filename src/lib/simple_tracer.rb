module RubyTrace
  class SimpleTracer
    attr_accessor :camera_location, :field_of_view, :background_color
    attr_reader :world, :pixels
    def initialize
      @camera_location = Point.new(0,0, 500)
      @field_of_view = FieldOfView.new()
      @world = World.new()
      @background_color = BasicColor.new(0,0,0)
      @pixels = nil
      @shader = LambertShader.new(0.2)
    end

    def trace
      (0...@field_of_view.width).each do |x|
        (0...@field_of_view.height).each do |y|
          ray = Point.new(@field_of_view.x + x, @field_of_view.y + y,0) - @camera_location
          yield x, y, trace_ray(ray)
        end
      end
    end

    private
      def trace_ray(ray)
        intersection = @world.first_intersection(@camera_location, ray)
        intersection ? calculate_point_color(intersection) : @background_color
      end

      def calculate_point_color(intersection)
        light_vector = (@world.light - intersection.point).normalize
        normal_vector = (intersection.object.normal_vector(intersection.point)).normalize
        @shader.shade(light_vector, normal_vector, intersection.object.color)
      end

  end
end
