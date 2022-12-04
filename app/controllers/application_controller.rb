class ApplicationController < ActionController::Base
	helper_method :current_user
		def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end
	def admin_only
		unless current_user.admin?
			unless @user == current_user
				flash.now[:notice] = "access denied"
				redirect_to sign_in_path
			end  
		end
	end
end
