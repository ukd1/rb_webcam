require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Webcam do
  context "when given camera_id is 0" do
    before do
      @c_webcam = Webcam.new(0)
    end

    it { @c_webcam.should_not be_nil }
    it { @c_webcam.capture_handler.should be_instance_of(FFI::Pointer) }
  end

  context "when grabs a frame" do
    subject { Webcam.new.grab }
    it { should == 1 }
  end

  context "when close a camera" do
    subject { Webcam.new.close }
    it { should be_nil }
  end

  context "when try to grab closed Webcam" do
    before do
      @webcam = Webcam.new
      @webcam.close
    end

    it { lambda{ @webcam.grab }.should raise_error(RuntimeError, "Camera has'nt be initialized") }
  end
end
