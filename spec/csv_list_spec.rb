require 'csv_list'
describe CSVList do
  before :all do
    @sample_data=<<CSV
header_1,header_2,header_3
1,2,3
aaa,bbb,ccc
CSV
  end
  it "parses CSV data and creates an OpenStruct for each line" do
    list=CSVList.new(@sample_data)
    list[0].header_1.should eq 1
    list[1].header_2.should eq "bbb"
  end
  it "Acts as an Enumerable" do
    list=CSVList.new(@sample_data)
    list.count.should eq 2
  end
  it "supports loading of CSV data from a file" do
    File.stub(:read).and_return(@sample_data)
    list=CSVList.load("filename.csv")
    list[0].header_3.should eq 3
  end
end
