require 'minitest/autorun'
load 'zad2.rb'

describe Odbiorca do
    before do 
        @odbiorca = Odbiorca.new([1,2,3])
    end
    describe "#initialize" do
        it "initialize new odbiorca" do
            @odbiorca.must_be_instance_of Odbiorca
        end

        it "check length after fill array random values" do
            @odbiorca.utworz_tablice(5,10).length.must_equal 5
        end

        it "check length after fill array random values" do
            @odbiorca.utworz_tablice!(5,10).length.must_equal 5
        end
        it "check the number of even numbers" do
            @odbiorca = Odbiorca.new([1,2,3,4])
            @odbiorca.ilosc_liczb_parzystych.must_equal 2
        end
        it "test odbiorca accesors" do
            @odbiorca.write_tab([1,2,3])
            @odbiorca.read_tab.must_equal [1,2,3]
        end    
        it "test reading odbiorca" do
            @odbiorca = Odbiorca.new([1,2,3,4])
            @odbiorca.to_s.must_equal "[1, 2, 3, 4]"
        end 
    end
end
