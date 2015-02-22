# encoding: utf-8

shared :string_slice do

  it "returns the character code of the character at the given index" do
    "hello".send(@method, 0).should == ?h
    "hello".send(@method, -1).should == ?o
  end

  it "returns nil if index is outside of self" do
    "hello".send(@method, 20).should == nil
    "hello".send(@method, -20).should == nil

    # TODO "".send(@method, 0).should == nil
    "".send(@method, -1).should == nil
  end

  it "calls to_int on the given index" do
    "hello".send(@method, 0.5).should == ?h

    obj = 1.0
    obj.respond_to?(:to_int).should == true
    "hello".send(@method, obj).should == ?e
  end

  it "raises a TypeError if the given index is nil" do
    lambda { "hello".send(@method, nil) }.should.raise(TypeError)
  end

  it "raises a TypeError if the given index can't be converted to an Integer" do
    # lambda { "hello".send(@method, mock('x')) }.should.raise(TypeError)
    lambda { "hello".send(@method, {})}.should.raise(TypeError)
    lambda { "hello".send(@method, [])}.should.raise(TypeError)
  end
end


shared :string_slice_index_length do
  it "returns the substring starting at the given index with the given length" do
    "hello there".send(@method, 0,0).should == ""
    "hello there".send(@method, 0,1).should == "h"
    "hello there".send(@method, 0,3).should == "hel"
    "hello there".send(@method, 0,6).should == "hello "
    "hello there".send(@method, 0,9).should == "hello the"
    "hello there".send(@method, 0,12).should == "hello there"

    "hello there".send(@method, 1,0).should == ""
    "hello there".send(@method, 1,1).should == "e"
    "hello there".send(@method, 1,3).should == "ell"
    "hello there".send(@method, 1,6).should == "ello t"
    "hello there".send(@method, 1,9).should == "ello ther"
    "hello there".send(@method, 1,12).should == "ello there"

    "hello there".send(@method, 3,0).should == ""
    "hello there".send(@method, 3,1).should == "l"
    "hello there".send(@method, 3,3).should == "lo "
    "hello there".send(@method, 3,6).should == "lo the"
    "hello there".send(@method, 3,9).should == "lo there"

    "hello there".send(@method, 4,0).should == ""
    "hello there".send(@method, 4,3).should == "o t"
    "hello there".send(@method, 4,6).should == "o ther"
    "hello there".send(@method, 4,9).should == "o there"

    "foo".send(@method, 2,1).should == "o"
    "foo".send(@method, 3,0).should == ""
    "foo".send(@method, 3,1).should == ""

    "".send(@method, 0,0).should == ""
    "".send(@method, 0,1).should == ""

    "x".send(@method, 0,0).should == ""
    "x".send(@method, 0,1).should == "x"
    "x".send(@method, 1,0).should == ""
    "x".send(@method, 1,1).should == ""

    "x".send(@method, -1,0).should == ""
    "x".send(@method, -1,1).should == "x"

    "hello there".send(@method, -3,2).should == "er"
  end

  it "always taints resulting strings when self is tainted" do
    str = "hello world"
    str.taint

    str.send(@method, 0,0).tainted?.should == true
    str.send(@method, 0,1).tainted?.should == true
    str.send(@method, 2,1).tainted?.should == true
  end

  it "returns nil if the offset falls outside of self" do
    "hello there".send(@method, 20,3).should == nil
    "hello there".send(@method, -20,3).should == nil

    "".send(@method, 1,0).should == nil
    "".send(@method, 1,1).should == nil

    "".send(@method, -1,0).should == nil
    "".send(@method, -1,1).should == nil

    "x".send(@method, 2,0).should == nil
    "x".send(@method, 2,1).should == nil

    "x".send(@method, -2,0).should == nil
    "x".send(@method, -2,1).should == nil
  end

  it "returns nil if the length is negative" do
    "hello there".send(@method, 4,-3).should == nil
    "hello there".send(@method, -4,-3).should == nil
  end

  it "calls to_int on the given index and the given length" do
    "hello".send(@method, 0.5, 1).should == "h"
    "hello".send(@method, 0.5, 2.5).should == "he"
    "hello".send(@method, 1, 2.5).should == "el"

    # obj = mock('2')
    # obj.should_receive(:to_int).exactly(4).times.and_return(2)

    # "hello".send(@method, obj, 1).should == "l"
    # "hello".send(@method, obj, obj).should == "ll"
    # "hello".send(@method, 0, obj).should == "he"
  end

  it "raises a TypeError when idx or length can't be converted to an integer" do
    lambda { "hello".send(@method, 'x', 0) }.should.raise(TypeError)
    lambda { "hello".send(@method, 0, 'x') }.should.raise(TypeError)

    # I'm deliberately including this here.
    # It means that str.send(@method, other, idx) isn't supported.
    lambda { "hello".send(@method, "", 0) }.should.raise(TypeError)
  end

  it "raises a TypeError when the given index or the given length is nil" do
    lambda { "hello".send(@method, 1, nil)   }.should.raise(TypeError)
    lambda { "hello".send(@method, nil, 1)   }.should.raise(TypeError)
    lambda { "hello".send(@method, nil, nil) }.should.raise(TypeError)
  end

  # it "returns subclass instances" do
  #   s = StringSpecs::MyString.new("hello")
  #   s.send(@method, 0,0).should be_kind_of(StringSpecs::MyString)
  #   s.send(@method, 0,4).should be_kind_of(StringSpecs::MyString)
  #   s.send(@method, 1,4).should be_kind_of(StringSpecs::MyString)
  # end
end

shared :string_slice_range do
  it "returns the substring given by the offsets of the range" do
    "hello there".send(@method, 1..1).should == "e"
    "hello there".send(@method, 1..3).should == "ell"
    "hello there".send(@method, 1...3).should == "el"
    "hello there".send(@method, -4..-2).should == "her"
    "hello there".send(@method, -4...-2).should == "he"
    "hello there".send(@method, 5..-1).should == " there"
    "hello there".send(@method, 5...-1).should == " ther"

    "".send(@method, 0..0).should == ""

    "x".send(@method, 0..0).should == "x"
    "x".send(@method, 0..1).should == "x"
    "x".send(@method, 0...1).should == "x"
    "x".send(@method, 0..-1).should == "x"

    "x".send(@method, 1..1).should == ""
    "x".send(@method, 1..-1).should == ""
  end

  it "returns nil if the beginning of the range falls outside of self" do
    "hello there".send(@method, 12..-1).should == nil
    "hello there".send(@method, 20..25).should == nil
    "hello there".send(@method, 20..1).should == nil
    "hello there".send(@method, -20..1).should == nil
    "hello there".send(@method, -20..-1).should == nil

    "".send(@method, -1..-1).should == nil
    "".send(@method, -1...-1).should == nil
    "".send(@method, -1..0).should == nil
    "".send(@method, -1...0).should == nil
  end

  it "returns an empty string if range.begin is inside self and > real end" do
    "hello there".send(@method, 1...1).should == ""
    "hello there".send(@method, 4..2).should == ""
    "hello".send(@method, 4..-4).should == ""
    "hello there".send(@method, -5..-6).should == ""
    "hello there".send(@method, -2..-4).should == ""
    "hello there".send(@method, -5..-6).should == ""
    "hello there".send(@method, -5..2).should == ""

    "".send(@method, 0...0).should == ""
    "".send(@method, 0..-1).should == ""
    "".send(@method, 0...-1).should == ""

    "x".send(@method, 0...0).should == ""
    "x".send(@method, 0...-1).should == ""
    "x".send(@method, 1...1).should == ""
    "x".send(@method, 1...-1).should == ""
  end

  it "always taints resulting strings when self is tainted" do
    str = "hello world"
    str.taint

    str.send(@method, 0..0).tainted?.should == true
    str.send(@method, 0...0).tainted?.should == true
    str.send(@method, 0..1).tainted?.should == true
    str.send(@method, 0...1).tainted?.should == true
    str.send(@method, 2..3).tainted?.should == true
    str.send(@method, 2..0).tainted?.should == true
  end

  # it "returns subclass instances" do
  #   s = StringSpecs::MyString.new("hello")
  #   s.send(@method, 0...0).should be_kind_of(StringSpecs::MyString)
  #   s.send(@method, 0..4).should be_kind_of(StringSpecs::MyString)
  #   s.send(@method, 1..4).should be_kind_of(StringSpecs::MyString)
  # end
  #
  # it "calls to_int on range arguments" do
  #   from = mock('from')
  #   to = mock('to')
  #
  #   # So we can construct a range out of them...
  #   from.should_receive(:<=>).twice.and_return(0)
  #
  #   from.should_receive(:to_int).twice.and_return(1)
  #   to.should_receive(:to_int).twice.and_return(-2)
  #
  #   "hello there".send(@method, from..to).should == "ello ther"
  #   "hello there".send(@method, from...to).should == "ello the"
  # end
  #
  # it "works with Range subclasses" do
  #   a = "GOOD"
  #   range_incl = StringSpecs::MyRange.new(1, 2)
  #   range_excl = StringSpecs::MyRange.new(-3, -1, true)
  #
  #   a.send(@method, range_incl).should == "OO"
  #   a.send(@method, range_excl).should == "OO"
  # end
end
