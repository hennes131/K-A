require 'faker'
require 'pg'

db = PG.connect( {:dbname => 'g16', :user => 'gerhardt', :password => '%G16Admin', :host => '172.16.161.82'} )

i = 2

while i < 100
	first_name = Faker::Name.unique.first_name
	last_name = Faker::Name.unique.last_name
	name = first_name+" "+last_name   
	email = Faker::Internet.unique.email(name)
	address = Faker::Address.unique.street_address
	city = Faker::Address.unique.city
	zip = Faker::Address.unique.zip
	gender = ["m", "w"].sample
	i = i+1
end


sql = "INSERT INTO customers (first_name, last_name, address, zip, city, gender, email) 
		#VALUES(#{first_name}, #{last_name}, #{address}, #{zip}, #{city}, #{email})"

db.exec(sql)

