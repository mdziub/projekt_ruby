
# class containing phone number
class PhoneNumber
  HOME = 0
  WORK = 1
  PERSONAL = 2

  attr_accessor :phone_number, :telephone_type

  def initialize(phone_number, telephone_type)
    phone_number = phone_number.delete '-' if phone_number.is_a? String
    @phone_number = phone_number
    @telephone_type = telephone_type
  end

  def to_s
    formatted = @phone_number.to_s.scan(/.{3}|.+/).join('-')
    formatted
  end

  def to_html
    result = '<b>'
    case telephone_type
    when PhoneNumber::HOME
      result += 'Home'
    when PhoneNumber::WORK
      result += 'Work'
    when PhoneNumber::PERSONAL
      result += 'Personal'
    end
    result += "</b>: #{self}"
    result
  end
end
