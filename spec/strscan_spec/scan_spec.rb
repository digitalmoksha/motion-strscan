# -*- encoding: utf-8 -*-

describe "StringScanner#scan" do
  before do
    @s = StringScanner.new("This is a test")
  end

  it "returns the matched string" do
    @s.scan(/\w+/).should == "This"
    @s.scan(/.../).should == " is"
    @s.scan(//).should == ""
    @s.scan(/\s+/).should == " "
  end

  # ruby_version_is "1.9" do
    it "returns the matched string for a multi byte string" do
      m = StringScanner.new("Привет!")
      m.scan(/[А-Яа-я]+/).should == "Привет"
      m.rest.should == "!"
    end
  # end

  it "treats ^ as matching from the beginning of the current position" do
    @s.scan(/\w+/).should == "This"
    @s.scan(/^\d/).should == nil
    @s.scan(/^\s/).should == " "
  end

  it "returns nil if there's no match" do
    @s.scan(/\d/).should == nil
  end

  it "returns nil when there is no more to scan" do
    @s.scan(/[\w\s]+/).should == "This is a test"
    @s.scan(/\w+/).should == nil
  end

  it "returns an empty string when the pattern matches empty" do
    @s.scan(/.*/).should == "This is a test"
    @s.scan(/.*/).should == ""
    @s.scan(/./).should == nil
  end

  it "raises a TypeError if pattern isn't a Regexp" do
    lambda { @s.scan("aoeu")    }.should.raise(TypeError)
    lambda { @s.scan(5)         }.should.raise(TypeError)
    lambda { @s.scan(:test)     }.should.raise(TypeError)
    # lambda { @s.scan(mock('x')) }.should.raise(TypeError)
  end
end
