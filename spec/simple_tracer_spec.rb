require 'spec_helper.rb'
include RubyTrace

describe SimpleTracer do
  describe '#trace' do
    let(:tracer) { SimpleTracer.new }

    it 'fires length * width callbacks' do
      height= 20
      width = 20
      tracer.field_of_view = FieldOfView.new(-(width/2), -(height/2), width, height)
      callbacks_count = 0
      tracer.trace do |x,y,color|
        callbacks_count = callbacks_count + 1
      end

      callbacks_count.should eq(height * width)
    end
  end
end

