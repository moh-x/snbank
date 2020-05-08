require_relative 'actions.rb'

login = main_menu()

if login == "1"
    if staff_login()
        if staff_menu == "1"
            create_user_accnt()
        elsif staff_menu == "2"
            #Check accnt detls
        elsif staff_menu == "3"
            #logout
        else
            puts "Wrong Input!"
            #make a restage here
        end
    else
        puts "Invalid Username or Password!"
        start_banking()
    end
elsif login == "2"
    if customer_login()
        if customer_menu() == "1"
            change_pin()
        elsif customer_menu() == "2"
            check_accnt_details()
        end
    end
elsif login == "3"
    cash_deposit()
elsif login == "4"
    cash_withdrawal()
elsif login == "5"
    close_app()
else
    puts "Invalid input!"
    main_menu()
end


=begin

if staff == true
    save_session()
    action = staff_menu()
else
    puts "We don't know you"
    close_app()
end

if action == 1
    create_bank_accnt()
    staff_menu()
elsif action == 2
    puts "Please type in your correct account number below."
    acc_num = gets.chomp.to_i
    check_accnt_details(acc_num)
    staff_menu()
else
    puts "Logging you out!"
    close_session()
    what_next = main_menu()
    if what_next == 2
        close_app()
    end
end


=end



