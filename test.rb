print "n: "
standard = 99
unique = 00000000


=begin
File.foreach("test.txt") { |line| 
    while line.include? unique.to_s
        accnt_no = (standard.to_s+(unique+1).to_s)
    end
    File.write ("test.txt", ("Account Number: "+accnt_no.to_s), mode: "a")
}
=end

=begin
File.open("log.txt", "a+") { |f| 
    line = f.read().split
    while line.include unique.to_s 
        accnt_no = (standard.to_s+(unique+1).to_s)
    end
    accnt_no = (standard.to_s+unique.to_s)
    f.write ("Account Number: "+accnt_no mode: "a") 
}
=end

#f = File.open("test.txt")
#customers = File.read("test.txt").split
=begin
class Blah
    attr_accessor :username, :password, :email, :full_name,
    def initialize(username, password, email, full_name,)
        @username = username
        @password = password
        @email = email
        @full_name = full_name
    end

    def 
end

blah001 = Blah.new(l,r,3,)
=end

