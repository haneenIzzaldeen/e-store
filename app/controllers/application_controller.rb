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
end
