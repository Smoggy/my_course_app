class ConstantContainer
	@@AdminRole = "admin"
	@@TeacherRole = "teacher"

	def self.admin_role
		@@AdminRole
	end
	def self.teacher_role
		@@TeacherRole
	end
end