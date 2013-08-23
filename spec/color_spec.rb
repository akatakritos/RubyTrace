require 'spec_helper.rb'
include RubyTrace

describe Color do
  describe '#initialize' do
    describe 'from integer' do
      it 'should set the right values' do
        r = 0xAA
        g = 0xBB
        b = 0xCC
        a = 0xDD
        color = Color.new(0xAABBCCDD)
        color.r.should == r
        color.g.should == g
        color.b.should == b
        color.a.should == a
        color.to_s.should == '#AABBCCDD'
      end
    end

    describe 'from rgba' do
      it 'should set the right values' do
        r = 0xAA
        g = 0xBB
        b = 0xCC
        a = 0xDD
        color = Color.new(r,g,b,a)
        color.r.should == r
        color.g.should == g
        color.b.should == b
        color.a.should == a
        color.to_s.should == '#AABBCCDD'
      end
    end
  end
end