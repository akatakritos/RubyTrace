require './src/autoload.rb'
require 'rubygems'
require 'imageruby'
require 'imageruby-bmp'
require 'optparse'

camera_loc = RubyTrace::Point.new(0,0,1000)
sphere_loc = RubyTrace::Point.new(0,0,-400)
sphere_radius = 200
sphere_color_str = "FF0000"
output_file = "output.bmp"

OptionParser.new do |opts|
  opts.banner = "usage: ruby #{$0} [opts]"

  opts.on("-c", "--color HEX", "Sets the color of the sphere in RGB hex") do |c|
    sphere_color_str = c
  end

  opts.on("-r", "--radius INT", "Sets the size of the sphere") do |s|
    sphere_radius = s.to_i
  end
end.parse!

output_file = ARGV.first if ARGV.any?

r = sphere_color_str[0..1].to_i(16) / 255.0
g = sphere_color_str[2..3].to_i(16) / 255.0
b = sphere_color_str[4..5].to_i(16) / 255.0
sphere_color = RubyTrace::BasicColor.new(r,g,b)


tracer = RubyTrace::SimpleTracer.new
tracer.camera_location = camera_loc
tracer.world.objects.push(RubyTrace::Sphere.new(sphere_loc, sphere_radius, sphere_color))

img = ImageRuby::Image.new(tracer.field_of_view.width, tracer.field_of_view.height, ImageRuby::Color.black)
tracer.trace do |x,y,color|
  img[x.to_i, y.to_i] = ImageRuby::Color.from_rgb( (color.r * 255).to_i, (color.g * 255).to_i, (color.b * 255).to_i)
end

img.save(output_file, :bmp)
