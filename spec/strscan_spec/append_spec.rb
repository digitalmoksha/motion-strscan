describe "StringScanner#<<" do
  it_behaves_like :strscan_concat, :<<
end

describe "StringScanner#<< when passed a Fixnum" do
  it_behaves_like :strscan_concat_fixnum, :<<
end
