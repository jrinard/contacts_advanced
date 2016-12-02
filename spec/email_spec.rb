require('rspec')
require('email')


describe(Email) do
  # before() do
  #   Email.clear()
  # end

  describe("#email_type") do
    it('returns the type of email')do
      test_email = Email.new({:email_type => "work", :email => "cody.brubaker@gmail.com"})
      expect(test_email.email_type()).to(eq("work"))
    end
  end

  describe("#email") do
    it('returns the email')do
      test_email = Email.new({:email_type => "work", :email => "cody.brubaker@gmail.com"})
      expect(test_email.email()).to(eq('cody.brubaker@gmail.com'))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Email.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the email to the array') do
      test_email = Email.new({:email_type => "work", :email => "cody.brubaker@gmail.com"})
      test_email.save()
      expect(Email.all()).to(eq([test_email]))
    end
  end


  describe('.clear') do
    it('clears the email array') do
      Email.new({:email_type => "home", :email => "cody.brubaker@gmail.com"}).save()
      Email.clear()
      expect(Email.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('gives a uniquie ID to an email') do
      test_email = Email.new({:email_type => "work", :email => "cody.brubaker@gmail.com"})
      expect(test_email.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('finds an specific email based on id') do
      test_email = Email.new({:email_type => "work", :email => "cody.brubaker@gmail.com"})
      test_email.save()
      test_email2 = Email.new({:email_type => "personal", :email => "cody.brubaker@yahoo.com"})
      test_email2.save()
      expect(Email.find(test_email.id())).to(eq(test_email))
    end
  end



end
