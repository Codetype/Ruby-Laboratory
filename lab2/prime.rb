input_array = ARGV

def is_number?(x)
    return Float(x) rescue false
end

def isPrime(x)

    for i in 2..Math.sqrt(x)
        if x % i == 0 
            return false 
        end
    end
    return true
end

input_array.each { 
    |x| 
    if is_number?(x) != false 
        puts "It is " + x + " prime? => " + isPrime(x.to_i).to_s 
    end
}



