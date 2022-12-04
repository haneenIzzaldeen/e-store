class UsersController < ApplicationController
    before_action :set_user, only: [:show, :destroy,:edit,:update]
	before_action :admin_only, only: [ :show,:index, :destroy,:edit,:update,:create ,:new]

	def new 
		@user = User.new    
	end
	def create 
		@user = User.new(user_params)
		if @user.save 
			redirect_to users_path
		end
	end
	def index 
		@users = User.all
	end 
	def show 
	end
    def update
        @user.update(user_params)
		redirect_to users_path
    end
	def edit
        
    end
    def destroy
        @user.destroy
		redirect_to users_path
    end
	def customer_signup 
		@customer = User.new(user_params.merge!({role: 'customer'}))
		if @customer.save 
			redirect_to sign_in_path
		end
	end
	def new_customer 
		@user = User.new    
	end

	def owner_signup 
		@owner = User.new(user_params.merge!({role: 'owner'}))
		if @owner.save 
			redirect_to sign_in_path
		end
	end
	def new_owner
		@owner = User.new    
	end

	private 
	def user_params
		params.require(:user).permit(:name,:email , :password, :role)
	end
    def set_user
        @user = User.find(params[:id])
	end
end
