class Email

attr_reader(:email_type, :email)
@@email_array = []
  define_method(:initialize) do |attributes|
    @email_type = attributes.fetch(:email_type)
    @email = attributes.fetch(:email)
    @id = @@email_array.length().+(1)
  end

  define_singleton_method(:all) do
    @@email_array
  end

  define_method(:save) do
    @@email_array.push(self)
  end

  define_singleton_method(:clear) do
    @@email_array = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |id|
    found_email = nil
    @@email_array.each() do |email|
    if email.id().eql?(id)
      found_email = email
      end
    end
    found_email
  end


end
