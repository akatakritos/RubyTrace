require 'spec_helper.rb'
include RubyTrace

describe Point do
  subject { Point.new }

  it { should respond_to :x }
  it { should respond_to :y }
  it { should respond_to :z }
  it { should respond_to :translate }
  it { should respond_to :add }
  it { should respond_to :'+' }
  it { should respond_to :sub }
  it { should respond_to :'-' }

  describe 'initialize' do
    it 'should set the right properties' do
      p = Point.new(1,2,3)
      p.x.should == 1
      p.y.should == 2
      p.z.should == 3
    end
  end

  describe 'equality' do
    describe 'equal points' do
      it 'should be equal' do
        p0 = Point.new(1,2,3)
        p1 = Point.new(1,2,3)
        p0.should == p1
        p0.eql?(p1).should be_true
      end

      it 'should have the same hash' do
        Point.new(5,6,7).hash.should == Point.new(5,6,7).hash
      end
    end

    describe 'unequal points' do
      it 'should not be equal' do
        p0 = Point.new(1,2,3)
        p1 = Point.new(4,5,6)
        p0.should_not == p1
        p0.eql?(p1).should be_false
      end
      it 'should have different hashes' do
        Point.new(1,2,3).hash.should_not == Point.new(4,5,6).hash
      end
    end
  end

  describe '#sub' do
    it 'should have the right vector result' do
      p0 = Point.new
      p1 = Point.new(1,2,3)
      v = p1 - p0
      v.should be_an_instance_of(Vector)
      v.x.should == 1
      v.y.should == 2
      v.z.should == 3
    end
  end

  describe 'translate' do
    it 'should return a new point moved over by the direction specified by vector' do
      p0 = Point.new
      v = Vector.new(3,4,5)
      p1 = p0.translate(v)

      p1.x.should == 3
      p1.y.should == 4
      p1.z.should == 5
    end

    it 'should be able to add and subtract back to the original' do
      p0 = Point.new
      v = Vector.new(6,2,7)
      p1 = p0.translate(v)
      p0.should == p1.translate(p0 - p1)
    end
  end
end