
# class containing personal data
class Person
  attr_accessor :first_name, :surname

  def initialize(first_name, surname)
    @first_name = first_name
    @surname = surname
  end

  def to_s
    @first_name + ' ' + @surname
  end
end
