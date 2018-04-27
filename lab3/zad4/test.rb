#!/usr/bin/env ruby
require 'minitest/autorun'
load 'main.rb'
 
# Tests
describe Client do
  before do
    @client1 = Client.new('Joanna', 'Kowalska')
    @client1.add_product('Tusz')
    @client1.add_product('Tusz')
    @client1.add_product('Pomadka')
    @client1.add_product('Szampon')
    @client1.add_product('Szampon')
    @client1.add_product('Papierosy')
    ######################
    @client2 = Client.new('Jerzy', 'Nowak')
    @client2.add_product('Piwo')
    @client2.add_product('Szampon')
  end
 
  describe '#possibilities' do
    it 'has name' do
      @client1.first_name.must_equal('Joanna', 'Niepoprawne imię')
      @client1.last_name.must_equal('Kowalska', 'Niepoprawne nazwisko')
    end
    it 'has unique id' do
      @client1.id.wont_equal(@client2.id, 'Id klienta nie jest unikalne')
    end

    it 'can displays full information' do
      proc { puts @client1 }.must_output("Joanna Kowalska\n\nRabat=10%\n\nTusz\nTusz\nPomadka\nSzampon\nSzampon\nPapierosy\n\nSuma=57\n")
      proc { puts @client2 }.must_output("Jerzy Nowak\n\nRabat=0%\n\nPiwo\nSzampon\n\nSuma=20\n")
    end
    it 'can modify personal data' do
      @client1.first_name = 'Joanna Urszula'
      @client1.last_name = 'Nowak'
      @client1.first_name.must_equal('Joanna Urszula', 'Niepoprawne imię')
      @client1.last_name.must_equal('Nowak', 'Niepoprawne nazwisko')
    end
    it 'properly stores products' do
      @client1.products.must_equal(%w[Tusz Tusz Pomadka Szampon Szampon Papierosy])
      @client2.products.must_equal(%w[Piwo Szampon])
    end
    it 'correctly calculates the discount' do
      @client1.has_discount?.must_equal(true, "Metoda 'has_discount?()' zwróciła błędną wartość")
      @client2.has_discount?.must_equal(false, "Metoda 'has_discount?()' zwróciła błędną wartość")
    end
  end
end



