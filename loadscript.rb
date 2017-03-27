require 'faker'
require 'pg'

db = PG.connect( {:dbname => 'g16', :user => 'gerhardt', :password => '%G16Admin', :host => 'localhost'} )

i = 2

while i < 10000
	if i % 100 == 0 
		Faker::Name.unique.clear
		Faker::Internet.unique.clear
		Faker::Address.unique.clear
	end
	first_name1 = Faker::Name.unique.first_name.tr("'","`")
	first_name = %Q(#{first_name1})
	last_name1 = Faker::Name.unique.last_name.tr("'","`")
	last_name = %Q(#{last_name1})
	name = first_name+" "+last_name 
	email = Faker::Internet.unique.email(name)
	address1 = Faker::Address.unique.street_address.tr("'","`")
	address = %Q(#{address1})
	city1 = Faker::Address.unique.city.gsub!("'","`")
	city = %Q(#{city1})
	zip = Faker::Address.unique.zip[0..4]
	gender = ["m", "w"].sample
	i = i+1


#puts zip
	sql = "INSERT INTO customers (first_name, last_name, address, zip, city, gender, email) 
		VALUES('#{first_name}', '#{last_name}', '#{address}', '#{zip}', '#{city}', '#{gender}', '#{email}');"

	db.exec(sql)
end
