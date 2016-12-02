require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contacts')
require('./lib/addresses')
require('./lib/phone')
require('./lib/email')

get('/') do
  erb(:index)
end

get('/contacts') do
  @contacts = Contact.all()
  erb(:contact_list)
end

get('/contacts/new') do
  erb(:contact_form)
end

post('/contacts') do
  @first_name = params.fetch("first_name")
  @last_name = params.fetch("last_name")
  @job_title = params.fetch("job_title")
  @company = params.fetch("company")
  Contact.new({:first_name => @first_name, :last_name => @last_name, :job_title => @job_title, :company => @company}).save()
  @contacts = Contact.all()
  erb(:success)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  @address = Address.find(params.fetch('id').to_i())
  @email = Email.find(params.fetch('id').to_i())
  @phone_number = Phone.find(params.fetch('id').to_i)
  @address_array = Address.all()
  @phone_array = Phone.all()
  @email_array = Email.all()
  erb(:contact_details)
end

post('/address') do
  @type = params.fetch("type")
  @address = params.fetch("address")
  @city = params.fetch("city")
  @state = params.fetch("state")
  @zip = params.fetch("zip")
  Address.new({:type => @type, :address => @address, :city => @city, :state => @state,:zip => @zip}).save()
  @address = Address.all()
  erb(:success)
end

post('/phone_number') do
  @phone_type = params.fetch("phone_type")
  @number = params.fetch("number")
  Phone.new({:phone_type => @phone_type, :number => @number}).save()
  @phone_number = Phone.all()
  erb(:success)
end

post('/email') do
  @email_type = params.fetch("email_type")
  @email = params.fetch("email")
  Email.new({:email_type => @email_type, :email => @email}).save()
  @email_address = Email.all()
  erb(:success)
end

get('/edit') do
  erb(:edit)
end
