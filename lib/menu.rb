# Menu class
class Menu
  attr_accessor :menu, :authors

  def initialize
    @menu = "== KSIAZKA TELEFONICZNA ==\n"
    @menu << "1. Pokaz kontakty\n"
    @menu << "2. Dodaj kontakt\n"
    @menu << "3. Wyszukaj kontakt po numerze\n"
    @menu << "4. Wyszukaj kontakt po nazwisku\n"
    @menu << "5. Wczytaj ksiazke\n"
    @menu << "6. Zapisz ksiazke\n"
    @menu << "0. Wyjscie\n"
  end

  def clear
    system 'clear'
    system 'cls'
  end

  def to_s
    menu
  end
end
