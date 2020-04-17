require_relative "actions.rb"
customers = []

login = main_menu()

if login == 1
    staff = login_check()
else
    close_app()
end


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






