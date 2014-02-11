class GroupsController < ApplicationController

	def create
		
	end

	def destroy

	end

	def index
		@groups = Group.all.paginate(page: params[:page])
	end

	private

		def groups_params
			params.require(:group).permite(:name)
		end
end
