#!/usr/bin/env ruby
require 'minitest/autorun'
load 'main.rb'

class TestSuma < MiniTest::Test
    def setup
        @wynik1 = suma(2,2)
        @wynik2 = suma(2, 1.5)
        @wynik3 = suma(2, '2')
        @wynik4 = suma('2.1', '2')
        #@wynik5 = suma(2, 'Ala ma kota123')
        @wynik6 = suma(Rational(3,7), Rational(11,7))
        @wynik7 = suma(Complex(1,3), Complex(2,5))
    end

    def test_suma
        assert_equal(@wynik1, 4)
        assert_equal(@wynik2, 3.5)
        assert_equal(@wynik3, 4)
        assert_equal(@wynik4, 4.1)
        #assert_equal(@wynik5, 2)
        assert_equal(@wynik6, (2/1))
        assert_equal(@wynik7, (3+8i))

    end
    def test_with_error
     assert_raises(ArgumentError) { suma(2, 'Ala ma kota123') }
    end
end
