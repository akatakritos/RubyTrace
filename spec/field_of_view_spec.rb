require 'spec_helper.rb'
include RubyTrace

describe FieldOfView do
  subject { FieldOfView.new }
  it { should respond_to :x }
  it { should respond_to :y }
  it { should respond_to :width }
  it { should respond_to :height }
  
  describe '#initialize' do

  end
end