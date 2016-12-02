require('rspec')
require('phone')


describe(Phone) do
  before() do
    Phone.clear()
  end

  describe("#phone_type") do
    it('returns the type of phone number')do
      test_phone = Phone.new({:phone_type => "cell", :number => 4196380201})
      expect(test_phone.phone_type()).to(eq("cell"))
    end
  end

  describe("#number") do
    it('returns the phone number')do
      test_phone = Phone.new({:phone_type => "cell", :number => 4196380201})
      expect(test_phone.number()).to(eq(4196380201))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the phone number to the array') do
      test_phone = Phone.new({:phone_type => "cell", :number => 4196380201})
      test_phone.save()
      expect(Phone.all()).to(eq([test_phone]))
    end
  end


  describe('.clear') do
    it('clears the phone number array') do
      Phone.new({:phone_type => "cell", :number => 4196380201}).save()
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('gives a uniquie ID to an phone number') do
      test_phone = Phone.new({:phone_type => "cell", :number => 4196380201})
      expect(test_phone.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('finds an specific address based on id') do
      test_phone = Phone.new({:phone_type => "cell", :number => 4196380201})
      test_phone.save()
      test_phone2 = Phone.new({:phone_type => "home", :number => 208315889})
      test_phone2.save()
      expect(Phone.find(test_phone.id())).to(eq(test_phone))
    end
  end



end
