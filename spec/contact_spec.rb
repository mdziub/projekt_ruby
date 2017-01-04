require 'simplecov'
SimpleCov.start

require 'contact'

RSpec.describe 'Contact' do
  let(:create_number) { PhoneNumber.new(123_123_123, PhoneNumber::PERSONAL) }
  let(:create_person) { Person.new('Jakub', 'Lakowski') }
  let(:create_contact) { Contact.new(create_person) }
  let(:create_contact_with_number) do
    contact = create_contact
    contact.add_number(create_number)
    contact
  end

  describe '#constructor' do
    it 'initializes without errors' do
      expect { create_contact }.not_to raise_error
    end

    it 'has an array of phone numbers' do
      expect(create_contact.phone_numbers).to eq([])
    end
  end

  describe '#add_number' do
    it 'should be defined' do
      expect { create_contact.add_number(create_number) }.not_to raise_error
    end
    it 'properly adds number to array' do
      contact = create_contact
      contact.add_number(create_number)

      expect(contact.phone_numbers.count).to eq(1)
    end
  end

  describe '#to_html' do
    it 'formats html properly' do
      contact = create_contact_with_number
      contact.add_number(PhoneNumber.new(333_333_333, PhoneNumber::HOME))

      expected_result = 'Jakub Lakowski<ul><li>'
      expected_result += contact.phone_numbers[0].to_html
      expected_result += '</li><li>'
      expected_result += "#{contact.phone_numbers[1].to_html}</li></ul>"
      expect(contact.to_html).to eql(expected_result)
    end
  end
end
