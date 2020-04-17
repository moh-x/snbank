
=begin
class Staff
    attr_accessor :username, :password, :email, :full_name,
    def initialize(username, password, email, full_name,)
        @username = username
        @password = password
        @email = email
        @full_name = full_name

    end

    def
    end
end

class Customer
    attr_accessor :
end
=end

def main_menu
    puts "Welcoome to the SNBank"
    puts "\t1. Staff Login\n\t2.Close App"
    puts "Please select one of the above options."
    return gets.chomp().to_i
end

def login_check
    username = gets.chomp().to_s
    password = gets.chomp().to_s
    File.foreach("staff.txt") { |line| puts staff }
    if username and password in staff
        return true
    else
        return false
end

def save_session
    File.open((username+".txt"), "a") { |f| f.write "#{Time.now} - User logged in\n" }
end

puts "Choose an action"
puts "\t1. Create new bank account\n\t2. Check Account Details\n\t3. Logout"
action = gets.chomp()

#an if statement to confirm action

def create_bank_accnt
    standard = 99 #A standard first two digit that is unique to our bank
    unique = 0000

    puts "Please supply the following information correctly."
    print "Account name: "
    accnt_name = gets.chomp()
    print "Opening Balance: "
    opening_bal = gets.chomp()
    print "Account Type: "
    accnt_type = gets.chomp()
    print "Account email: "
    accnt_email = gets.chomp()
    File.foreach("staff.txt") { |line| puts customer }

