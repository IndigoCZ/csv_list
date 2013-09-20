require 'csv'
require 'ostruct'
class CSVList
  include Enumerable
  def initialize(csv_data)
    @list=CSV.parse(csv_data, csv_parse_options).map do |line|
      wrap_line(line)
    end
  end
  def self.load(filename)
    self.new(File.read(filename))
  end
  def each
    @list.each do |line|
      yield line if block_given?
    end
  end
  def [](index)
    @list[index]
  end
  private
  def csv_parse_options
    {:headers => true, :header_converters => :symbol, :converters => :all} 
  end
  def wrap_line(line,wrapper=OpenStruct)
    wrapper.new(prepare(line))
  end
  def prepare(line)
    line.to_hash
  end
end
