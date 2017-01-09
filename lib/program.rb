require_relative 'contact'
require_relative 'person'
require_relative 'phone_number'
require_relative 'phonebook'
require_relative 'menu'

menu = Menu.new
phonebook = Phonebook.new

loop do
  puts menu.to_s
  case gets.chop

  when '1' # pokaz kontakty
    menu.clear
    phonebook.print
    gets.chop
    menu.clear
  when '2' # dodaj kontakt
    menu.clear
    print 'Podaj imie: '
    name = gets.chop
    print 'Podaj nazwisko: '
    surname = gets.chop
    person = Person.new(name,surname)
    contact = Contact.new(person)
    loop do
      puts 'Zeby dodac nowy numer:'
      puts 'DOMOWY - wcisnij 1'
      puts 'SLUZBOWY - wcisnij 2'
      puts 'KOMORKOWY - wcisnij 3'
      puts ', aby zakonczyc dodawanie numerow wcisnij x'
      input = gets.chop
      case input
      when '1'
        type = PhoneNumber::HOME
      when '2'
        type = PhoneNumber::WORK
      when '3'
        type = PhoneNumber::PERSONAL
      when 'x'
        break
      else
        next
      end
      puts 'Podaj nowy numer: '
      number = gets.chop
      while number.scan(/\D/).empty? == false
        puts 'Podaj nowy numer: '
        number = gets.chop
      end
      phonenumber = PhoneNumber.new(number, type)
      contact.add_number(phonenumber)
    end
    phonebook.add_contact(contact)
    menu.clear
  when '3' # wyszukaj kontakt po numerze
    menu.clear
    puts 'Podaj numer: '
    number = gets.chop
    while number.scan(/\D/).empty? == false
      puts 'Podaj numer: '
      number = gets.chop
    end
    found_contacts = phonebook.find_by_number(number)
    found_contacts.each(&:print)
    gets.chop
    menu.clear
  when '4' # wyszukaj kontakt po nazwisku
    menu.clear
    print 'Podaj nazwisko: '
    input = gets.chop
    found_contacts = phonebook.find_by_surname(input)
    found_contacts.each(&:print)
    gets.chop
    menu.clear
  when '5' # wczytaj ksiazke
    menu.clear
    puts 'Podaj nazwe pliku z ksiazka'
    input = gets.chop
    phonebook.load_from_file(input)
    menu.clear
  when '6' # zapisz ksiazke
    menu.clear
    puts 'Podaj nazwe pliku z ksiazka'
    input = gets.chop
    phonebook.save_to_file(input)
    menu.clear
  when '0'
    break
  else
    menu.clear
  end
end
