class UsersController < ApplicationController
	before_action :admin_only, only: [ :show,:index, :destroy,:edit,:update]
    before_action :set_user, only: [:show, :destroy,:edit,:update]
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
	def edit
        
    end
    def destroy
        @user.destroy
		redirect_to users_path
    end
	private 
	def user_params
		params.require(:user).permit(:name,:email , :password,:role)
	end
    def set_user
        @user = User.find(params[:id])
	end
		def admin_only
		unless current_user.admin?
			unless @user == current_user
				flash.now[:notice] = "access denied"
				redirect_to sign_in_path
			end  
		end
	end
	def owner_only
		unless current_user.owner?
			unless @user == current_user
				flash.now[:notice] = "access denied"
				redirect_to sign_in_path
			end  
		end
	end
end
