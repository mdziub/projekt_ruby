
# class containing phonebook
class Phonebook
  attr_accessor :contacts

  def initialize
    @contacts = []
  end

  def add_contact(contact)
    contacts << contact if contact.instance_of? Contact
  end

  def find_by_person(person)
    contacts.select { |x| x.person.first_name == person.first_name }
  end

  def find_by_number(phonenumber)
    contacts.select { |x| x.phone_numbers.include? phonenumber }
  end

  def save_to_file(filename)
    filename = filename.to_s.delete '/'
    Dir.mkdir 'saved_phonebooks' unless File.directory?('saved_phonebooks')
    File.open('saved_phonebooks/' + filename, 'w') { |f| f.write(Marshal.dump(contacts)) }
  end

  def load_from_file(filename)
    filename = filename.to_s.delete '/'
    @contacts = Marshal.load(File.read('saved_phonebooks/' + filename))
  end

  def export_to_html(filename)
    Dir.mkdir 'html' unless File.directory?('html')
    result = "<h1>Ksiazka adresowa</h1>\n<p>\n"
    @contacts.each do |contact|
      result += "#{contact.to_html}<br>\n"
    end
    File.open('html/' + filename + '.html', 'w') { |file| file.write(result) }
  end
end
