class Group < ActiveRecord::Base
	has_many :students
	validates :name, presence: true, uniqueness: true
	MAX_STUDENTS = 15


	def has_vacancies?
		students.length < MAX_STUDENTS
	end

end
