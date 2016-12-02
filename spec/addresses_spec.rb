require('rspec')
require('addresses')

describe(Address) do
  before() do
    Address.clear()
  end

  describe('#address') do
    it('return the address of the addresses') do
      test_address = Address.new({:type => "home", :address => "100 Infinity Loop", :city => "Gotham", :state => "New York",:zip => "80431"})
      expect(test_address.address()).to(eq("100 Infinity Loop"))
    end
  end

  describe('#city') do
    it('return the city of the addresses') do
      test_address = Address.new({:type => "home", :address => "100 Infinity Loop", :city => "Gotham", :state => "New York",:zip => "80431"})
      expect(test_address.city()).to(eq("Gotham"))
    end
  end

  describe('#state') do
    it('return the state of the addresses') do
      test_address = Address.new({:type => "home", :address => "100 Infinity Loop", :city => "Gotham", :state => "New York",:zip => "80431"})
      expect(test_address.state()).to(eq("New York"))
    end
  end

  describe('#zip') do
    it('return the zip of the addresses') do
      test_address = Address.new({:type => "home", :address => "100 Infinity Loop", :city => "Gotham", :state => "New York",:zip => "80431"})
      expect(test_address.zip()).to(eq("80431"))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Address.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the address data to the array') do
      test_address = Address.new({:type => "home", :address => "100 Infinity Loop", :city => "Gotham", :state => "New York",:zip => "80431"})
      test_address.save()
      expect(Address.all()).to(eq([test_address]))
    end
  end

  describe('.clear') do
    it('clears the address array') do
      Address.new({:type => "home", :address => "100 Infinity Loop", :city => "Gotham", :state => "New York",:zip => "80431"}).save()
      Address.clear()
      expect(Address.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('gives a uniquie ID to an address') do
      test_address = Address.new({:type => "home", :address => "100 Infinity Loop", :city => "Gotham", :state => "New York",:zip => "80431"})
      expect(test_address.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('finds an specific address based on id') do
      test_address = Address.new({:type => "home", :address => "100 Infinity Loop", :city => "Gotham", :state => "New York",:zip => "80431"})
      test_address.save()
      test_address2 = Address.new({:type => "work", :address => "512 CR 42", :city => "Helena", :state => "Ohio",:zip => "43435"})
      test_address2.save()
      expect(Address.find(test_address.id())).to(eq(test_address))
    end
  end



end
