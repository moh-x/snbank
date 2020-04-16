require_relative "actions.rb"

puts "Welcoome to the SNBank"
puts "\t1. Staff Login\n\t2.Close App"
puts "Please select one of the above options."

standard = 99 #A standard first two digit that is unique to our bank
unique = 0000

start = gets.chomp().to_i

if start == 1

begin
    
rescue => exception
    
else
    
end


def login_check
    username = gets.chomp().to_s
    password = gets.chomp().to_s
    File.foreach("staff.txt") { |line| puts staff }
    until username and password in staff
        puts = "Invalid password, Please try again."
        username = gets.chomp().to_s
        password = gets.chomp().to_s
    end
    File.open((username".txt"), "a") { |f| f.write "#{Time.now} - User logged in\n" }
end

puts "Choose an action"
puts "\t1. Create new bank account\n\t2. Check Account Details\n\t3. Logout"
action = gets.chomp()

#an if statement to confirm action

def create_bank_accnt
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

