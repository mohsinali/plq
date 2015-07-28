# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

## Roles
Role.delete_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE roles_id_seq RESTART WITH 1")

Role.create(name: "user")
Role.create(name: "manager")
Role.create(name: "agent")
Role.create(name: "vendor")
Role.create(name: "admin")

puts "Roles created: User, Manager, Agent, Vendor, Admin."

user = User.create(email: "admin@plq.com", password: "321321321", name: "Kerwin", approved: true)
user.add_role :admin

puts "Admin created."


## Countries
Country.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE countries_id_seq RESTART WITH 1")

file = Rails.public_path.to_s + "/countries_seed.csv"
CSV.foreach(file) do |row|      
  Country.create(name: row[1], code: row[0])
end

puts "Countries uploaded."


## Languages
Language.delete_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE languages_id_seq RESTART WITH 1")
Language.create(name: "Arabic")
Language.create(name: "English")
Language.create(name: "French")
Language.create(name: "Hindi/Urdu")
Language.create(name: "Portuguese")
Language.create(name: "Spanish")

puts "Languages added: Arabic, English, French, Hindi/Urdu, Portuguese, Spanish."