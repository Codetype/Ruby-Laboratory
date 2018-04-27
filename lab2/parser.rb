y = ARGV

line1 = "First line of the text" 
line2 = "123-456-789"

if line1 =~ /text(.*)/
    puts "Line1 contains text"
end
if line2 =~ /[0-9]/
    puts line2
end

puts /1 \+ 2 = 3\?/.match('Does 1 + 2 = 3?')

test1 = "x = 1 Ala ma kota"

re = test1.gsub(/[=\d]/)

puts test1[/[a-z] \= \d/]

test2 = "y=(Kowalski & Nowak)"

puts test2[/[a-z]\=/]

puts ["666f666f626172"].pack('H*')

def parse(x)
    result = x[/[a-z] \= \d/]
    result += "&"

end 

parse(test1)
