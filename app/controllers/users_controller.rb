class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	@user.role = Role.find(params[:user][:role_id])
  	if @user.save
  		flash[:success] = "User has been created"
  		redirect_to root_path
  	else
  		flash[:danger] = "Error"
  		redirect_to root_path
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		flash[:success] = "Profile updated"
  		redirect_to root_path
  	else
  		render 'edit'
  	end
  end

  def index
    @users = User.joins(:role).where("roles.name = '#{ConstantContainer.teacher_role}'").paginate(page: params[:page], :per_page => 5)
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :login, :password, :password_confirmation)
  	end
end
