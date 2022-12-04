class SessionsController < ApplicationController
	def new 
		@user = User.new
	end
	def create 
		@user = User.find_by(email: user_params[:email])
		if @user && @user.is_password?(user_params[:password])
			session[:user_id] = @user.id

				case @user.role
				when 'admin'
				    redirect_to admin_home_path
				when 'customer'
					redirect_to root_path 
				when 'owner'
					redirect_to owner_home_path
			end
	
		else 
			flash.now[:notice] = "invalid email and password"
			render :new , status: 422
		end
	end
	def destroy 
		log_out
		redirect_to sign_in_path
	end
	def home
	end
	private 
	def user_params
		params.require(:user).permit(:email , :password)
	end
end
