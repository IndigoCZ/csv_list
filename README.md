csv_list
========

OpenStruct wrapper for CSV files

## Typical usage

```ruby
require 'csv_list'
list=CSVList.load("data.csv")
list.each do |line|
  puts line.column_header
end
```
