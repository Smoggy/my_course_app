class StudentsController < ApplicationController
	def index
		@group = Group.find(params[:format])
	end

	def create

	end

	def update

	end

	def destroy

	end
end
