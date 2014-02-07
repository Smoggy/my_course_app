namespace :db do 
	desc "Fill database with data"
	task populate: :environment do
		make_roles
		make_users
	end
end

def make_roles
	Role.create(name: "admin")
	Role.create(name: "teacher")
end

def make_users
	adminRole = Role.find_by(name: "admin")
	User.create!(name: "Example User",
				 login: "login",
				 password: "qwerty",
				 password_confirmation: "qwerty",
				 role: adminRole )
end