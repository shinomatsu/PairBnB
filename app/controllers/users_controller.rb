class UsersController < ApplicationController
	before_action :set_user,only: [:show,:edit,:update]
	
	def index
	end

	def show
		# @user = User.find(params[:id])
	end

	def edit
		
	end

	def update
		# @user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path
		else
			render :edit
		end

	end


private
def set_user
	@user = User.find(params[:id])


	end

	def user_params
		params.require(:user).permit(:first_name,:last_name,:email)

	end

  
end