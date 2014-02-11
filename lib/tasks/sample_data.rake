namespace :db do 
	desc "Fill database with data"
	task populate: :environment do
		make_roles
		make_users
		make_groups
	end
end

def make_roles
	Role.create(name: "admin")
	Role.create(name: "teacher")
end

def make_users
	adminRole = Role.find_by(name: "admin")
	teacherRole = Role.find_by(name: "teacher")
	User.create!(name: "Example User",
				 login: "login1",
				 password: "qwerty",
				 password_confirmation: "qwerty",
				 role: adminRole )
	11.times do |n|
	    name = Faker::Name.name
	    login = "login#{n+2}"
	    password = "password"
	    User.create!(name: name,
	                 login: login,
	                 password: password,
	                 password_confirmation: password,
	                 role: teacherRole)
	end

end

def make_groups
	Group.create!(name: "MF-11")
	Group.create!(name: "MF-12")
end

def make_students

end