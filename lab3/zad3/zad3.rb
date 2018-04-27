#!/usr/bin/env ruby
class String
    def is_upper?
       self == self.upcase
    end
end
class Zad3
    def is_number?(obj)
        obj.to_s == obj.to_i.to_s
    end
    def add(a,b)
        if is_number? a and is_number? b 
            return Integer(a)+ Integer(b)
        end
    end
    def sub(a,b)
        if is_number? a and is_number? b 
            return Integer(a) - Integer(b)
        end
    end
    def mul(a,b)
        if is_number? a and is_number? b 
            return Integer(a) * Integer(b)
        end
    end
    def div(a,b)
        if is_number? a and is_number? b 
            return Integer(a) / Integer(b)
        end    
    end
    def reverse(a)
        return a.reverse!
    end

    def swapcase(s)
        buff = ""
        s.split("").each do |i|
            if i.is_upper?
                buff += i.downcase
            else
                buff += i.upcase                 
            end
        end
        return buff
    end
end

def app_help()
    helparr  = ['--add <number> <number> [add two numbers]',
                '--reverse <string> [reverse given string]',
                '--swapcase <string> [swap upper- to lower- and lowercase to uppercase]']
    return helparr
end
if __FILE__ == $PROGRAM_NAME
def main()
    if ARGV.length == 0
        puts "You don't set up option or arguments. Possible option is:"
        puts app_help()
    end
    

    inputs_array = ARGV
    instance1 = Zad3.new
  
        case inputs_array[0]
            when '--add'
                p instance1.add( inputs_array[1], inputs_array[2])
            when '--reverse'
                p instance1.reverse(inputs_array[1].dup)
            when '--swapcase'
                p instance1.swapcase(inputs_array[1])
        end
    
end

main
end
