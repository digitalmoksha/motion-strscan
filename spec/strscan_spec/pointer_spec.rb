describe "StringScanner#pointer" do
  it_behaves_like(:strscan_pos, :pointer)
end

describe "StringScanner#pointer=" do
  it_behaves_like(:strscan_pos_set, :pointer=)
end
