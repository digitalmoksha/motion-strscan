describe "StringScanner#pos" do
  it_behaves_like(:strscan_pos, :pos)
end

describe "StringScanner#pos=" do
  it_behaves_like(:strscan_pos_set, :pos=)
end
