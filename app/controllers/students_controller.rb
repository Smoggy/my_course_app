class StudentsController < ApplicationController

	def index
		@group = Group.find(params[:format])
		@students = @group.students.paginate(page: params[:page])
	end

	def new
		@student = Student.new
		@group = Group.find(params[:format])
	end

	def create
		@student = Student.new(student_params)
		@student.group = Group.find(params[:student][:group])

		if @student.save
			flash[:success] = "Student created"
			redirect_to students_path(@student.group)
		else
			render 'new'
		end
	end

	def update

	end

	def destroy
		student = Student.find(params[:id])
		group = student.group
		student.destroy
		flash[:success] = "Student deleted"
		redirect_to students_url(group)
	end

	private 
		def student_params
			params.require(:student).permit(:name, :birth_year)
		end


end
