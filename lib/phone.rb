class Phone

attr_reader(:phone_type, :number)

  @@phone_array = []
  define_method(:initialize) do |attributes|
    @phone_type = attributes.fetch(:phone_type)
    @number = attributes.fetch(:number)
    @id = @@phone_array.length().+(1)
  end

  define_singleton_method(:all) do
    @@phone_array
  end

  define_method(:save) do
    @@phone_array.push(self)
  end

  define_singleton_method(:clear) do
    @@phone_array = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |id|
    found_number = nil
    @@phone_array.each do |number|
      if number.id().eql?(id)
        found_number = number
    end
  end
  found_number
end


end
