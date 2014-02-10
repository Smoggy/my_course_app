class User < ActiveRecord::Base
	belongs_to :role

	before_create :create_remember_token
	validates :name, presence: true, length: { maximum: 50 }
	validates :login, presence: true, uniqueness: { case_sensitive: false }
	has_secure_password
	validates :role, presence: true
	validates :password, length: { minimum: 6 }
	
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def is_admin?
		self.role.name.eql? ConstantContainer.admin_role
	end

	private 

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end

end
