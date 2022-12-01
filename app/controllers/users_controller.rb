class UsersController < ApplicationController
	before_action :admin_only, only: [:show, :index, :destroy]
    before_action :set_user, only: [:show, :destroy]
	def new 
		@user = User.new    
	end
	def create 
		@user = User.new(user_params)
		if @user.save 
		end
	end
	def index 
		@users = User.all
	end 
	def show 
	end
    def update
        @user.update(user_params)
    end
    def destroy
        @user.destroy
    end
	private 
	def user_params
		params.require(:user).permit(:name,:email , :password)
	end
    def set_user
        @user = User.find(params[:id])
	end
		def admin_only
		unless current_user.admin?
			unless @user == current_user
				flash.now[:notice] = "access denied"
				redirect_to root_path
			end  
		end
	end
end
