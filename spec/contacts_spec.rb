require('rspec')
require('contacts')
require('addresses')
require('phone')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe('#first_name') do
    it('returns the name of the contact') do
      test_contact = Contact.new({:first_name =>'Bruce', :last_name => 'Wayne', :job_title => "CEO", :company => "Wayne Enterprises"})
      expect(test_contact.first_name()).to(eq("Bruce"))
    end
  end

  describe('#last_name') do
    it('returns the name of the contact') do
      test_contact = Contact.new({:first_name =>'Bruce', :last_name => 'Wayne', :job_title => "CEO", :company => "Wayne Enterprises"})
      expect(test_contact.last_name()).to(eq("Wayne"))
    end
  end

  describe('#job_title') do
    it('returns the job title') do
      test_contact = Contact.new({:first_name =>'Bruce', :last_name => 'Wayne', :job_title => "CEO", :company => "Wayne Enterprises"})
      expect(test_contact.job_title()).to(eq("CEO"))
    end
  end

  describe('#company') do
    it('returns the name of the contact') do
      test_contact = Contact.new({:first_name =>'Bruce', :last_name => 'Wayne', :job_title => "CEO", :company => "Wayne Enterprises"})
      expect(test_contact.company()).to(eq("Wayne Enterprises"))
    end
  end

  describe(".all") do
    it("is empty at first")do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("adds a contact to the array of saved contact list") do
      test_contact = Contact.new({:first_name =>'Bruce', :last_name => 'Wayne', :job_title => "CEO", :company => "Wayne Enterprises"})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved contacts") do
      Contact.new({:first_name =>'Bruce', :last_name => 'Wayne', :job_title => "CEO", :company => "Wayne Enterprises"}).save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the id of the contact') do
      test_contact = Contact.new({:first_name =>'Bruce', :last_name => 'Wayne', :job_title => "CEO", :company => "Wayne Enterprises"})
      expect(test_contact.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns a contact by finding it unique id') do
      test_contact = Contact.new({:first_name =>'Bruce', :last_name => 'Wayne', :job_title => "CEO", :company => "Wayne Enterprises"})
      test_contact.save()
      test_contact2 = Contact.new({:first_name =>'Clark', :last_name => 'Kent', :job_title => "Reporter", :company => "Daily Planet"})
      test_contact2.save()
      expect(Contact.find(test_contact.id())).to(eq(test_contact))
    end
  end

  describe("#add_address") do
    it('adds a new address to a contact') do
      test_contact = Contact.new({:first_name =>'Bruce', :last_name => 'Wayne', :job_title => "CEO", :company => "Wayne Enterprises"})
      test_address = Address.new({:type => 'Home', :address => "100 Infinity Loop", :city => "Gotham", :state => "New York",:zip => "80431"})
      test_contact.add_address(test_address)
      expect(test_contact.location()).to(eq([test_address]))
    end
  end

  describe("#add_number") do
    it('adds a new address to a contact') do
      test_contact = Contact.new({:first_name =>'Bruce', :last_name => 'Wayne', :job_title => "CEO", :company => "Wayne Enterprises"})
      test_phone = Phone.new({:phone_type => "cell", :number => 4196380201})
      test_contact.add_number(test_phone)
      expect(test_contact.numbers()).to(eq([test_phone]))
    end
  end

  describe("#add_email") do
    it('adds a email to a contact') do
      test_contact = Contact.new({:first_name =>'Bruce', :last_name => 'Wayne', :job_title => "CEO", :company => "Wayne Enterprises"})
      test_email = Email.new({:email_type => "work", :email => "cody.brubaker@gmail.com"})
      test_contact.add_email(test_email)
      expect(test_contact.emails()).to(eq([test_email]))
    end
  end



end
