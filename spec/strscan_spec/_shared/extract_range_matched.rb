shared :extract_range_matched do
  it "returns an instance of String when passed a String subclass" do
    cls = Class.new(String)
    sub = cls.new("abc")

    s = StringScanner.new(sub)
    s.scan(/\w{1}/)

    ch = s.send(@method)
    ch.should.not.be.kind_of(cls)
    ch.should.be.an.instance_of(String)
  end

  it "taints the returned String if the input was tainted" do
    str = 'abc'
    str.taint

    s = StringScanner.new(str)
    s.scan(/\w{1}/)
    s.send(@method).tainted?.should.be_true
  end
end
