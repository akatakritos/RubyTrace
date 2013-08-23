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
      x1 = field_of_view.x
      x2 = x1 + field_of_view.width
      y1 = field_of_view.y
      y2 = y1 + field_of_view.height
      z  = 0

      x1..x2 do |x|
        y1..y2 do |y|
          ray = Point.new(x,y,0) - @camera_location
          yield x, y, trace_ray(ray)
        end
      end
    end

    private
      def trace_ray
        intersection = @world.first_intersection(@camera_location, ray)
        intersection ? calculate_point_color(intersection) : @background_color
      end

      def calculate_point_color(intersection)
        light_vector = (@world.light - intersection).normalize
        normal_vector = (intersection.object.normal_vector(intersection.point)).normalize
        @shader.shade(light_vector, normal_vector, intersection.object.color)
      end

  end
end