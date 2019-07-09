require "./contact"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end
    puts "Name search results (#{search})"
    results.each do |contact|
      puts contact.to_s('full_name')
      puts contact.print_phone_numbers
      puts contact.print_addresses
      puts "\n"
    end
  end

  def find_by_phone_number(number)
    results = []
    search = number.gsub("-", "")
    contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub("-", "").include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Phone search results (#{search})", results)
  end

  def find_by_address(query)
    results = []
    search = query.downcase
    contacts.each do |contact|
      contact.addresses.each do |address|
        if address.to_s('long').downcase.include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Address search results (#{search})", results)
  end
  
  def print_results(search, results)
    puts search
    results.each do |contact|
      puts contact.to_s('full_name')
      puts contact.print_phone_numbers
      puts contact.print_addresses
      puts "\n"
    end
  end
end

address_book = AddressBook.new

alan = Contact.new
alan.first_name = "Alan"
alan.last_name = "McClenaghan"
alan.add_phone_number("Home", "0208-000-000")
alan.add_phone_number("Mobile", "07909-000-000")
alan.add_address("Home", "123 High St", "" ,"London", "UK", "123456")

matthew = Contact.new
matthew.first_name = "Matthew"
matthew.middle_name = "P"
matthew.last_name = "McClenaghan"
matthew.add_phone_number("Home", "0208-000-000")
matthew.add_address("Home", "123 High St", "" ,"London", "UK", "123456")

address_book.contacts.push(alan)
address_book.contacts.push(matthew)

# address_book.print_contact_list
# address_book.find_by_name("m")
# address_book.find_by_phone_number("2")
address_book.find_by_address('High')