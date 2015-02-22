shared :strscan_concat do
  it "concatenates the given argument to self and returns self" do
    s = StringScanner.new("hello ")
    s.send(@method, 'world').should == s
    s.string.should == "hello world"
    s.eos?.should.be_false
  end

  it "raises a TypeError if the given argument can't be converted to a String" do
    lambda { a = StringScanner.new('hello').send(@method, :world)    }.should.raise(TypeError)
    # lambda { a = StringScanner.new('hello').send(@method, mock('x')) }.should.raise(TypeError)
  end
end

shared :strscan_concat_fixnum do
  it "raises a TypeError" do
    a = StringScanner.new("hello world")
    lambda { a.send(@method, 333) }.should.raise(TypeError)
    b = StringScanner.new("")
    lambda { b.send(@method, (256 * 3 + 64)) }.should.raise(TypeError)
    lambda { b.send(@method, -200)           }.should.raise(TypeError)
  end

  # it "doesn't call to_int on the argument" do
  #   x = mock('x')
  #   x.respond_to?(:to_int).should == false
  #
  #   lambda { "".send(@method, x) }.should.raise(TypeError)
  # end
end

