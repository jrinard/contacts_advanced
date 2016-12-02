class Contact
  attr_reader(:first_name, :last_name, :job_title, :company)

  @@contacts = []
  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @id = @@contacts.length().+(1)
    @location = []
    @numbers = []
    @emails = []
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_method(:id) do
    @id
  end

  define_method(:location) do
    @location
  end

  define_method(:numbers) do
    @numbers
  end

  define_method(:emails) do
    @emails
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@contacts.each do |contact|
      if contact.id().eql?(id)
        found_contact = contact
      end
    end
    found_contact
  end

  define_method(:add_address) do |address|
    @location.push(address)
  end

  define_method(:add_number) do |number|
    @numbers.push(number)
  end

  define_method(:add_email) do |email|
    @emails.push(email)
  end



end
