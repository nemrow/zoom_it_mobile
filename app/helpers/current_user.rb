def current_user
	@current_user = User.find(session[:user_id].to_i) if session[:current_user]
end