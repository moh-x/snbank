require_relative "actions.rb"


def close_app
    abort "Thank you for banking with us, Bye!"
end

def wrong_input
    print "You have made an invalid input, please try again."
    puts " Input x to quit banking"
    i = gets.chomp()
    return i
end


login = main_menu()
if main_menu() == 1
    user = login_check()
elsif start == 2
    app_closed()
else
    wrong_input()
    until wrong_input() == 2
        main_menu()
    end
    close_app()
end

if user = true
    save_session()
else



until username and password in staff
    puts = "Invalid username or password, Please try again."
    username = gets.chomp().to_s
    password = gets.chomp().to_s
end




