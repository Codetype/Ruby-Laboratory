#!/usr/bin/env ruby
class Client
    def initialize(fname, lname)
        @first_name = fname
        @last_name = lname
        @products = []
        @id = @id
    end
    def add_product(prod)
       @products.push(prod)
    end
    attr_reader :id
    attr_accessor :first_name
    attr_accessor :last_name
    attr_reader :products    
    def has_discount?
        if @products.length >= 5
            return true
        else
            return false        
        end
    end
    def sum_cost
       amnt = @products.length
       if amnt >= 5 
           return 0.95*(amnt*10)
        else
           return amnt*10       
        end 
    end
    def to_s
        discount = 0
        if has_discount?
            discount = 0,05
        end
        @cost = (1-discount)*products.length
        return "#{@first_name} Rabat=#{@last_name} #{@products.to_s}Suma=#{@cost}"
    end
end
class Grocery

end

def main
    @client1 = Client.new('Joanna', 'Kowalska')
    @client1.add_product('Tusz')
    @client1.add_product('Tusz')
    @client1.add_product('Pomadka')
    @client1.add_product('Szampon')
    @client1.add_product('Szampon')
    @client1.add_product('Papierosy')
    puts @client1.first_name
    puts @client1.last_name
    puts @client1.products  
    puts @client11.to_s

end 

main
