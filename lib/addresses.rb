class Address
  attr_reader(:type, :address, :city, :state, :zip)

  @@address_array = []
  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @address = attributes.fetch(:address)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
    @id = @@address_array.length().+(1)
  end

  define_singleton_method(:all) do
    @@address_array
  end

  define_method(:save) do
    @@address_array.push(self)
  end

  define_singleton_method(:clear) do
    @@address_array = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |id|
    found_address = nil
    @@address_array.each do |address|
      if address.id().eql?(id)
        found_address = address
      end
    end
    found_address
  end

end
