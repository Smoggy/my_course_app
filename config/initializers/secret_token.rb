# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#MyCourseApp::Application.config.secret_key_base = '54910494a986f9b62f8643bae6f3795b98f2e968bf02ebbda146d520e0e4343eb7ed1490d9fde5c86cfd5cf648c28516be24bf3775b0d614d4a04e86ea289af6'


def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		File.read(token_file).chomp
	else
		token = SecureRandom.hex(64)
		File.write(token_file,token)
		token
	end
end

MyCourseApp::Application.config.secret_key_base = secure_token