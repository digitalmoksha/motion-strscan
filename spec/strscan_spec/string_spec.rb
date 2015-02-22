describe "StringScanner#string" do
  before do
    @string = "This is a test"
    @s = StringScanner.new(@string)
  end

  it "returns the string being scanned" do
    @s.string.should == "This is a test"
    @s << " case"
    @s.string.should == "This is a test case"
  end

  it "returns the identical object passed in" do
    @s.string.equal?(@string).should.be_true
  end
end

describe "StringScanner#string=" do
  before do
    @s = StringScanner.new("This is a test")
  end

  it "changes the string being scanned to the argument and resets the scanner" do
    @s.string = "Hello world"
    @s.string.should == "Hello world"
  end

  # TODO it "converts the argument into a string using #to_str" do
  #   m = mock(:str)
  #
  #   s = "test"
  #   m.should.receive(:to_str).and.return(s)
  #
  #   @s.string = m
  #   @s.string.should == s
  # end
end
