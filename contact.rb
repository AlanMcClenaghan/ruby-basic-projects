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

end

alan = Contact.new
alan.first_name = "Alan"
alan.last_name = "McClenaghan"
puts alan.first_name + " " + alan.last_name