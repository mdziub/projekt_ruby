
# class containing contact info
class Contact
  attr_accessor :person, :phone_numbers

  def initialize(person)
    @phone_numbers = []
    @person = person
  end

  def add_number(number)
    phone_numbers << number
  end

  def to_html
    result = person.to_s + '<ul>'
    @phone_numbers.each do |number|
      result += "<li>#{number.to_html}</li>"
    end
    result += '</ul>'
  end
end
