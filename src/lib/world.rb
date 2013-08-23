module RubyTrace
  class World

    attr_reader :light, :objects
    def initialize
      @light = Point.new(-320, -240, 0)
      @objects = Array.new
    end

    def first_intersection(eye_position, ray_vector)
      @objects.each do |o|
        point = o.intersection(eye_position, ray_vector.normalize)
        if point
          return Intersection.new(point, o) unless point.nil?
        end
      end
      nil
    end
  end
end