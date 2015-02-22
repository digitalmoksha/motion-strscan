describe "StringScanner#inspect" do
  before do
    @s = StringScanner.new("This is a test")
  end

  it "returns a String object" do
    @s.inspect.should.be.kind_of(String)
  end

  it "returns a string that represents the StringScanner object" do
    @s.inspect.should == "#<StringScanner 0/14 @ \"This ...\">"
    @s.scan_until /is/
    @s.inspect.should == "#<StringScanner 4/14 \"This\" @ \" is a...\">"
    @s.terminate
    @s.inspect.should == "#<StringScanner fin>"
  end
end
