#!/usr/bin/env ruby
load "zad3.rb"
require 'minitest/autorun'

describe 'Zad3' do
    before do 
        @instance1 = Zad3.new
    end
    describe "arithmetic operations" do
        it "adding two numbers" do
            @instance1.add(4,2).must_equal 6
            @instance1.add(4,"Ala123").must_equal nil
            @instance1.add(6.7, 2).must_equal nil
        end   
        it "substracting two numbers" do
            @instance1.sub(4,2).must_equal 2
            @instance1.sub(4,"la123").must_equal nil
            @instance1.sub(6.78, 2).must_equal nil
        end   
        it "multiplying two numbers" do
            @instance1.mul(4,2).must_equal 8
            @instance1.mul(4,"Ala13").must_equal nil
            @instance1.mul(4, 2.14).must_equal nil
        end   
        it "dividing two numbers" do
            @instance1.div(4,2).must_equal 2
            @instance1.div(4,"123f").must_equal nil
            @instance1.div(6, 6.99).must_equal nil
        end   
    end
    describe "reversing string" do
        it "revers given string" do
            @instance1.reverse("Kajak").must_equal "kajaK"
            @instance1.reverse("ABCcba").must_equal "abcCBA"
        end      
    end
    describe "swapcasing string" do
        it "swapcase given strin" do
            @instance1.swapcase("AbC").must_equal "aBc"
            @instance1.swapcase("kAJAk").must_equal "KajaK"
        end      
    end
end
