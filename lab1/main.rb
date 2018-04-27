#!/usr/bin/env ruby

    # Oblicza 'x' + 'y'
    #
    # @param x [Integer, Float, String, Rational, Cmplex] pierwszy składnik
    # @param y [Integer, Float, String, Rational, Cmplex] drugi składnik
    # return [Integer, Float, Rational, Cmplex] suma dwóch liczb||
    def suma(x,y)
        raise ArgumentError, TypeError, 'Argument is not Numeric or String type' unless (x.is_a?(Numeric) || y.is_a?(Numeric) || x.is_a?(String) || y.is_a?(String))
        #if(!x.is_a?(Numeric) && !x.is_a?(String) && !y.is_a?(Numeric) && !y.is_a?(String))
        #   warn("\e[4m#{__FILE__}:#{__LINE__}\e[0m: \e[31mArgument funkcji 'suma()' nie jest ani liczbą, ani napisem\e[0m")
        #else
            if(x.class == String || y.class == String)
                sum = Float(x) + Float(y)
            else
                sum = x+y
            end
        #end
        return sum;
    end

    #wywołanie dla odpalenia z terminala w formia suma = <wynik sumowania>
    if __FILE__ == $PROGRAM_NAME
        print "Suma = " + suma(1,2).to_s + "\n"
    end
