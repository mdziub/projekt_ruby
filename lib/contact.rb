
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

  def print
    puts "#{person}\n"
    @phone_numbers.each do |number|
      case number.telephone_type
      when PhoneNumber::HOME
        puts 'Home'
      when PhoneNumber::WORK
        puts 'Work'
      when PhoneNumber::PERSONAL
        puts 'Personal'
      end
      puts " - #{number.phone_number} \n"
    end
    puts "\n"
  end

  def to_html
    result = person.to_s + '<ul>'
    @phone_numbers.each do |number|
      result += "<li>#{number.to_html}</li>"
    end
    result += '</ul>'
  end
end
