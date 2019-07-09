require "./phone_number"

class Contact
  attr_writer :first_name, :middle_name, :last_name
  attr_reader :phone_numbers

  def first_name
    @first_name
  end

  def middle_name
    @middle_name
  end

  def last_name
    @last_name
  end

  def full_name
    full_name = first_name
    if !@middle_name.nil?
      full_name += " "
      full_name += middle_name
    end
    full_name += ' '
    full_name += last_name
    full_name
  end

  def last_first
    last_first = last_name
    last_first += ", "
    last_first += first_name
    if !@middle_name.nil?
      last_first += " "
      last_first += middle_name.slice(0, 1)
      last_first += "."
    end
    last_first
  end

  def first_last
    first_name + " " + last_name
  end

  def to_s(format = 'full_name')
    case format
    when 'full_name'
      full_name
    when 'last_first'
      last_first
    when 'first'
      first_name
    when 'last'
      last_name
    else
      first_last
    end
  end

  def initialize
    @phone_numbers = []
  end

  def add_phone_number(kind, number)
    phone_number = PhoneNumber.new
    phone_number.kind = kind
    phone_number.number = number
    phone_numbers.push(phone_number)
  end

  def print_phone_numbers
    puts "Phone Numbers"
    phone_numbers.each { |phone_number| phone_number }
  end

end

alan = Contact.new
alan.first_name = "Alan"
alan.last_name = "McClenaghan"
alan.add_phone_number("Home", "0208-000-000")
alan.add_phone_number("Mobile", "07909-000-000")
puts alan.to_s('full_name')
# puts alan.to_s('last_first')
puts alan.print_phone_numbers

# matthew = Contact.new
# matthew.first_name = "Matthew"
# matthew.middle_name = "P"
# matthew.last_name = "McClenaghan"
# puts matthew.to_s('last_first')
# puts matthew.to_s('first_last')