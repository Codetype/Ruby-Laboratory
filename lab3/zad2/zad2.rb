# @author Pawel Gedlek (pawelgedlek@gmail.com)
class Odbiorca
  @tab = [1,2,3] 
  def initialize(value)
    @tab = value
  end
  # @attr_writer [Array] - set array of numbers
  def write_tab(tab)
    @tab = tab
  end
  # @attr_reader [Array] - return array of numbers
  def read_tab
    return @tab
  end
  # @to_string [String] - return array to String    
  def to_s
    return @tab.to_s()
  end
  # @inspect [String] 
  def inspect
    "Wywołano metodę 'inspect()'"
  end
  # @komunikat [String] - get instance value
  def komunikat
    puts "Metoda instancyjna: " + @tab.to_s
  end
  # @self.komunikat [String] - get class value
  def self.komunikat
    puts "Metoda klasowa: " + @tab.to_s
  end
  # @utworz_tablice [Array] - return array with random numbers in given interval 
  def utworz_tablice(n, m)
   tab = n.times.map {rand(m)+1}
   return tab 
  end
  # @utworz_tablice! [Array] - return instance array with random numbers in given interval 
  def utworz_tablice!(n, m)
   @tab = n.times.map {rand(m)+1}
  end
  # @ilosc_liczb_parzystych [Integer] - return number of even numbers in array
  def ilosc_liczb_parzystych
    count = @tab.select {|item| (item%2).zero?}
    return count.length
  end
end
#########################
if __FILE__ == $PROGRAM_NAME or __FILE__ == './Rakefile'
def main
Odbiorca.komunikat
Odbiorca.send('komunikat')
odbiorca = Odbiorca.new([4,5,6])
p odbiorca.utworz_tablice(3,10)
p odbiorca.utworz_tablice!(3,10)
p odbiorca.ilosc_liczb_parzystych
odbiorca.komunikat
odbiorca.send('komunikat')
puts odbiorca
p odbiorca
odbiorca.write_tab([1,3,5])
p odbiorca.read_tab
end
main
end
