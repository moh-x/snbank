#require 'rubygems'
#require 'json'
#require 'pp'
#require_relative 'bank.rb'

def main_menu
    puts "Welcoome to the SNBank"
    puts "Please choose an action below:"
    puts "\t1. Login as Staff\n\t2. Login as Customer\n\t3. Close App"
    return gets.chomp
end

def staff_login
    puts "Please input your username and password below:"
    print "Username: "
    username = gets.chomp
    print "Password: "
    password = gets.chomp
    staffs  = eval(File.read('staff.txt'))
    staffs.each { |staff|
        if staff.key(password) and staff.key(username)
            return true
            break
        end
    }
end

def customer_login
    puts "Please input your Account Number and PIN below:"
    print "Account Number: "
    accnt_no = gets.chomp
    print "PIN: "
    pin = gets.chomp
    staffs = eval(File.read('customers.txt'))
    staffs.each { |staff|
        if staff.key(pin) and staff.key(accnt_no)
            return true
            break
        end
    }
end

def staff_menu
    puts "Please select an action below to proceed"
    puts "\t1. Create bank account for new user\n\t2. Check user account details\n\t3. Logout"
    action = gets.chomp
    return action
end

def customer_menu
    puts "Please select an action below to proceed"
    puts "\t1. Change PIN\t2. Check Account Balance\n\t3. Make Some Cash Deposit\n\t4. Make Some Cash Withdrawal"
    action = gets.chomp
    return action
end

def generate_accnt_num
    customers = eval(File.read('customers.txt'))
    if customers.empty?
        accnt_num = "3030000000"
    else
        customers.each { |customer|
            last_user = customer[-1]
            last_accnt_num = last_user['a/n']
            accnt_num = last_accnt_num.to_i + 1
        }
    end
    return accnt_num
end

def format_info(customer)
    #must be passed a customer hash
    user_info = ("\n------------ New Account Information --------------")
    user_info += ("\n\tAccount name: "+customer["name"])
    user_info += ("\n\tAccount Number: "+customer["a/n"])
    user_info += ("\n\tBalance: ₦ "+customer["balance"]+".00")
    user_info += ("\n\ttype: "+customer["type"])
    user_info += ("\n\temail: "+customer["email"])
    user_info += ("\n\tInitial PIN: "+customer["pin"])
    return user_info
end

def create_user_accnt
    puts "Please supply the following information correctly."
    print "Account name: "
    accnt_name = gets.chomp()
    print "Opening Balance (₦): "
    opening_bal = gets.chomp()
    print "Account Type: "
    accnt_type = gets.chomp()
    print "Account email: "
    accnt_email = gets.chomp()
    accnt_num = generate_accnt_num()
    
    customer = {
        "name"=>accnt_name,
        "balance"=>opening_bal,
        "type"=>accnt_type,
        "email"=>accnt_email,
        "a/n"=>accnt_num,
        "pin"=>'0000'
    }
    update_db('customers.txt', customer)
    puts "\nAccount Creation Successful!"
    puts format_info(customer)
end

def change_pin
    puts "Please input your Account Number below for confirmation"
    print "Account Number: "
    ac_no = gets.chomp
    puts "Please input a PIN below (4-6 digits)\n\tPin: "
    pin = gets.chomp
    if pin.length < 4 or pin.length > 6
        puts "Invalid PIN length!"
        change_pin()
    else
        customers = eval(File.read('customers.txt'))
        customers.each { |customer|
            if customer.key(ac_no)
                customer['pin'] = pin
                update_db('customers.txt', customers)
                puts "Change of PIN Successful!"
                break
            end
        }
    end
end

def check_accnt_details
    puts "Please input your account number below for confirmation:"
    print "Account Number: "
    ac_no = gets.chomp
    customers = eval(File.read('customers.txt'))
    customers.each { |customer|
        if customer.key(ac_no)
            puts format_info(customer)
            break
        end
    }
end

def cash_deposit
    puts "Please input your account number below for confirmation:"
    print "Account Number: "
    ac_no = gets.chomp
    puts "How much do you wish to deposit?"
    print "Amount: "
    deposit = gets.chomp
    customers = eval(File.read('customers.txt'))
    customers.each { |customer|
        if customer.key(ac_no)
            new_balance = customer['balance'].to_i + deposit.to_i
            customer['balance'] = new_balance.to_s
            update_db('customer.txt', customers)
            break
        end
    }
end

def cash_withdraw
    puts "Please input your account number below for confirmation:"
    print "Account Number: "
    ac_no = gets.chomp
    puts "How much do you wish to withdraw?"
    print "Amount: "
    withdrawal = gets.chomp
    customers = eval(File.read('customers.txt'))
    customers.each { |customer|
        if customer.key(ac_no)
            if withdrawal.to_i <= customer['balance'].to_i
                new_balance = customer['balance'].to_i - withdrawal.to_i
                customer['balance'] = new_balance.to_s
                update_db('customer.txt', customers)
                break
            else
                puts "Insufficient Funds!"
            end
        end
    }
end

def update_db(filename, new_info)
    db = eval(File.read(filename))
    db << new_info
    File.write(filename, db)
end


=begin
def save_session
    File.open((username+".txt"), "a") { |f| f.write "#{Time.now} - User logged in\n" }
end

def close_session
    File.open((username+".txt"), "a") { |f| f.write "#{Time.now} - User logged out\n" }
end

#an if statement to confirm action



def close_app
    abort "Thank you for banking with us, Bye!"
end



def login_option
    #give user option to login with username and password or accnt no and Pin
    puts "Please select an option."
    puts "\t1. Login with Password.\n\t2. Login with PIN."
    choice = gets.chomp
    if choice == "1"
        user_login()
    elsif choice == "2"
        pin_login()
    else
        puts "Invalid input!"
        login_option()
end



def accnt_balance
end


def search_file(info, file,)


=end


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