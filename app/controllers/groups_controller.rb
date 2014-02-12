class GroupsController < ApplicationController

	def create
		@group = Group.new(group_params)
		if @group.save
			redirect_to groups_path
		else
			@groups = Group.all.paginate(page: params[:page])
			render "groups/index"
		end
	end

	def destroy

	end

	def index
		@groups = Group.all.paginate(page: params[:page])
		@group = Group.new
	end

	private

		def group_params
			params.require(:group).permit(:name)
		end
end
