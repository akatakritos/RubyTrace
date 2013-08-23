require './src/autoload.rb'
require 'rubygems'
require 'imageruby'
require 'imageruby-bmp'

tracer = RubyTrace::SimpleTracer.new
tracer.camera_location = RubyTrace::Point.new(0,0,1000)
tracer.world.objects.push(RubyTrace::Sphere.new(RubyTrace::Point.new(0,0,-400),200))

img = ImageRuby::Image.new(tracer.field_of_view.width, tracer.field_of_view.height, ImageRuby::Color.black)
tracer.trace do |x,y,color|
  #puts "#{x}, #{y}, #{color}"
  img[x.to_i, y.to_i] = ImageRuby::Color.from_rgb( (color.r * 255).to_i, (color.g * 255).to_i, (color.b * 255).to_i)
end

img.save('output.bmp', :bmp)