module RubyTrace
  class Intersection

    attr_reader :point, :object
    def initialize(point, object)
      @point = point
      @object = object
    end
  end
end