class SessionsController < ApplicationController
	def new 
		@user = User.new
	end
	def create 
		@user = User.find_by(email: user_params[:email])
		if @user && @user.is_password?(user_params[:password])
			session[:user_id] = @user.id
			redirect_to 
		else 
			flash.now[:notice] = "invalid email and password"
			render :new , status: 422
		end
	end
	def destroy 
		log_out
		redirect_to sign_in_path
	end
	private 
	def user_params
		params.require(:user).permit(:email , :password)
	end
end
