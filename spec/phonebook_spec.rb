require 'simplecov'
SimpleCov.start

require 'phonebook'

RSpec.describe 'Phonebook' do
  let(:create_phonebook) { Phonebook.new }
  let(:create_number) { PhoneNumber.new(123_123_123, PhoneNumber::PERSONAL) }
  let(:create_number2) { PhoneNumber.new(321_321_321, PhoneNumber::HOME) }
  let(:create_person) { Person.new('Jakub', 'Lakowski') }
  let(:create_person2) { Person.new('James', 'Kowalski') }
  let(:create_contact) do
    contact = Contact.new(create_person)
    contact.add_number(create_number)
    contact
  end
  let(:create_contact2) do
    contact = Contact.new(create_person2)
    contact.add_number(create_number2)
    contact
  end
  let(:create_phonebook_with_contacts) do
    phonebook = create_phonebook
    phonebook.add_contact(create_contact)
    phonebook.add_contact(create_contact2)
    phonebook
  end

  describe '#initialization' do
    it 'initializes without errors' do
      expect { create_phonebook }.not_to raise_error
    end

    it 'initializes empty' do
      person = create_phonebook
      expect(person.contacts.count).to eq(0)
    end
  end

  describe '#add_contact' do
    it 'should be defined' do
      expect { create_phonebook.add_contact(create_contact) }.not_to raise_error
    end

    it 'should add contact to list' do
      phonebook = create_phonebook
      phonebook.add_contact(create_contact)
      expect(phonebook.contacts.count).to eq(1)
    end

    it 'should not add not-a-contact to list' do
      phonebook = create_phonebook
      phonebook.add_contact('not a contact, but a string')
      expect(phonebook.contacts.count).to eq(0)
    end
  end

  describe '#find_by_surname' do
    it 'should be defined' do
      expect { create_phonebook.find_by_surname(create_person) }.not_to raise_error
    end

    it 'should find right contact by surname' do
      phonebook = create_phonebook_with_contacts
      found_person = phonebook.find_by_surname(create_person.surname).first.person
      expect(found_person).to eq(create_person)
    end
  end

  describe '#find_by_number' do
    it 'should be defined' do
      expect { create_phonebook.find_by_number(create_number) }.not_to raise_error
    end
    it 'should find right contact by phonenumber' do
      phonebook = create_phonebook_with_contacts
      number = create_contact.phone_numbers.first.phone_number
      found_contact = phonebook.find_by_number(number).first
      expect(found_contact.person).to eq(create_person)
    end
  end
  describe '#save_to_file' do
    it 'should create a file' do
      File.delete('saved_phonebooks/test') if File.exist?('saved_phonebooks/test')

      expect { create_phonebook.save_to_file('test') }.not_to raise_error
      expect(File.file?('saved_phonebooks/test')).to be true
    end
  end

  describe '#load_from_file' do
    it 'should load phonebook from saved file' do
      File.delete('saved_phonebooks/test') if File.exist?('saved_phonebooks/test')

      phonebook = create_phonebook_with_contacts
      phonebook.save_to_file('test')

      new_phonebook = Phonebook.new
      new_phonebook.load_from_file('test')
      expect(new_phonebook.contacts.count).to eq(2)
    end
  end
  describe '#export_to_html' do
    it 'should export phonebook to html' do
      File.delete('html/test.html') if File.exist?('html/test.html')

      phonebook = create_phonebook_with_contacts
      phonebook.export_to_html('test')
    end
  end
end
