describe "StringScanner#clear" do
  it_behaves_like(:strscan_terminate, :clear)

  # it "warns in verbose mode that the method is obsolete" do
  #   s = StringScanner.new("abc")
  #   begin
  #     old = $VERBOSE
  #     lambda {
  #       $VERBOSE = true
  #       s.clear
  #     }.should complain(/clear.*obsolete.*terminate/)
  #
  #     lambda {
  #       $VERBOSE = false
  #       s.clear
  #     }.should_not complain
  #   ensure
  #     $VERBOSE = old
  #   end
  # end
end
