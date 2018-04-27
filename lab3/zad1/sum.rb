sum_of_even = ARGV.map {|file_path| File.open(file_path).each_line.map {|line| line.split.select{|num| (num.to_i % 2).zero? }.length }.inject(:+)}.inject(:+)

print "Number of even numbers in given files is: " + sum_of_even.to_s + "\n"






