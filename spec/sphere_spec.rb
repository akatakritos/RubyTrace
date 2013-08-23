require 'spec_helper.rb'
include RubyTrace

describe Sphere do
  subject { Sphere.new }
  it { should respond_to :center }
  it { should respond_to :radius }
  it { should respond_to :color }
  it { should respond_to :intersection }

  describe '#initialize' do
    it 'should set the right variables' do
      p = Point.new(1,2,3)
      c = BasicColor.new(1,0.5,0)
      s = Sphere.new(p, 10, c)
      s.center.should == p
      s.radius.should == 10
      s.color.should == c
    end
  end

  describe '#intersection' do
    it 'should return a point when intersecting' do
      eye = Point.new
      center = Point.new(10,0,0)
      sphere = Sphere.new(center, 1)
      ray = center - eye

      intersection = sphere.intersection(eye, ray)
      intersection.should be_an_instance_of(Point)
      intersection.should == Point.new(9,0,0)
    end

    it 'should return nil for a miss' do
      eye = Point.new
      center = Point.new(10,0,0)
      sphere = Sphere.new(center, 1)
      ray = Vector.new(0,1,0)

      sphere.intersection(eye, ray).should be_nil
    end
  end
end