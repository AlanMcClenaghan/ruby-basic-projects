class Contact
  attr_writer :first_name, :middle_name, :last_name

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
end

alan = Contact.new
alan.first_name = "Alan"
alan.last_name = "McClenaghan"
puts alan.first_name + " " + alan.last_name

matthew = Contact.new
matthew.first_name = "Matthew"
matthew.middle_name = "P"
matthew.last_name = "McClenaghan"
puts matthew.full_name