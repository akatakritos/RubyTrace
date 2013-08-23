require 'spec_helper.rb'

describe Vector do

  subject { Vector.new }

  it { should respond_to :x }
  it { should respond_to :y }
  it { should respond_to :z }
  it { should respond_to :add }
  it { should respond_to :"+" }
  it { should respond_to :sub }
  it { should respond_to :"-" }
  it { should respond_to :mult }
  it { should respond_to :"*" }
  it { should respond_to :magnitude }
  it { should respond_to :dot }
  it { should respond_to :angle }

  describe 'initialize' do
    it 'should set x,y,z' do
      result = Vector.new(1,2,3)
      result.x.should == 1
      result.y.should == 2
      result.z.should == 3
    end
  end

  describe 'ZERO' do
    it 'should be all zeros' do
      Vector::ZERO.should == Vector.new(0,0,0)
    end
  end

  let(:v) { Vector.new(1,2,3) }

  describe '#add' do
    
    it 'should change each value' do
      result = v.add Vector.new(1,1,1)
      result.x.should eq(v.x + 1)
      result.y.should eq(v.y + 1)
      result.z.should eq(v.z + 1)
    end

    it 'can be done with the + operator' do
      expect {result = v + Vector.new(1,1,1)}.to_not raise_error
    end

    it 'should be a different object' do
      result = v.add v
      v.object_id.should_not == result.object_id
    end
  end

  describe '#sub' do
    it 'should change each value' do
      result = v.sub Vector.new(1,2,3)
      result.x.should == v.x-1
      result.y.should == v.y-2
      result.z.should == v.z-3
    end

    it 'can be done using the - operator' do
      expect { result = v - v }.to_not raise_error
    end

    it 'should be a different object' do
      result = v - v
      result.object_id.should_not == v.object_id
    end
  end

  describe '#mult' do
    it 'should change each value equally' do
      result = v.mult 5
      result.x.should == v.x * 5
      result.y.should == v.y * 5
      result.z.should == v.z * 5
    end

    it 'can be done with the * operator' do
      expect { result = v * 5 }.to_not raise_error
    end

    it 'should be a different object' do
      result = v * 5
      result.object_id.should_not == v.object_id
    end
  end

  describe '#magnitude' do
    it 'should return 1 for x' do
      Vector.new(1,0,0).magnitude.should == 1
    end
    it 'should return 1 for y' do
      Vector.new(0,1,0).magnitude.should == 1
    end
    it 'should return 1 for z' do
      Vector.new(0,0,1).magnitude.should == 1
    end
  end

  describe '#dot' do
    it 'should return a scalar' do
      (v.dot v).should be_an_instance_of(Fixnum)
    end

    it 'should be 0 when dotted with zero' do
      v.dot(Vector::ZERO).should == 0
    end
  end

  describe '#angle' do
    it 'should get pi/2' do
      v1 = Vector.new(1,0,0)
      v2 = Vector.new(0,1,0)
      v1.angle(v2).should == Math::PI / 2
    end

    it 'should be zero for same vector' do
      v.angle(v).should == 0
    end
  end

end