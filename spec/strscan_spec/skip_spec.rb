describe "StringScanner#skip" do
  before do
    @s = StringScanner.new("This is a test")
  end

  it "returns length of the match" do
    @s.skip(/\w+/).should == 4
    @s.skip(/\s+\w+/).should == 3
  end

  it "returns nil if there's no match" do
    @s.skip(/\s+/).should == nil
    @s.skip(/\d+/).should == nil
  end
end