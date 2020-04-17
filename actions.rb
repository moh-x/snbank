

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

def close_session
    File.open((username+".txt"), "a") { |f| f.write "#{Time.now} - User logged out\n" }
end

def staff_menu
    puts "Choose an action"
    puts "\t1. Create new bank account\n\t2. Check Account Details\n\t3. Logout"
    action = gets.chomp().to_i
    return action
end
#an if statement to confirm action

def create_bank_accnt
    standard = 99 #A standard first two digit that is unique to our bank
    unique = 00000000 #Unique to each customer

    puts "Please supply the following information correctly."
    print "Account name: "
    accnt_name = gets.chomp().titleize
    print "Opening Balance (₦): "
    opening_bal = gets.chomp()
    print "Account Type: "
    accnt_type = gets.chomp()
    print "Account email: "
    accnt_email = gets.chomp()
    file_data = File.read("customer.txt").split
    if unique.to_s in file_data
        unique += 1
    end
    accnt_no = (standard.to_s+(unique+1).to_s)
    customer = {
        "name"=>accnt_name
        "bal"=>("₦ "+opening_bal.to_s+".00")
        "type"=>accnt_type
        "email"=>accnt_email
        "a/n"=>accnt_no
    }
    #I could just write my customer array to the text file through serialization; but No!
    #Lets do some formatting ;)
    user_info = format_info()
    File.write("customer.txt", user_info, mode: "a")
    customers << customer
    return customer
end

def format_info(customer)
    #must be passed a customer hash
    user_info = ("\n--------------Customer ID: "+customer["a/n"][2:]+"------------")
    user_info += ("\n\tAccount name: "+customer["name"])
    user_info += ("\n\tAccount Number: "+customer["a/n"])
    user_info += ("\n\tBalance: "+customer["bal"])
    user_info += ("\n\ttype: "+customer["type"])
    user_info += ("\n\temail: "+customer["email"])
    return user_info
end

def check_accnt_details(acc_num)
    customers.each do |customer|
        if customer["a/n"] == acc_num
            puts format_info(customer)
        else
            puts "Invalid account number"
            close_app()
    end
end

def close_app
    abort "Thank you for banking with us, Bye!"
end

=begin
def wrong_input
    print "You have made an invalid input, please try again."
    puts " Input x to quit banking"
    i = gets.chomp()
    return i
end
=end

#I tried using classes but omo e too hard.
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