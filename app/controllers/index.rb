get '/' do
	if session[:user_id]
		redirect to '/playa'
	end
  @fb_login_link = FBHelper.get_login_link
  erb :not_logged_in
end

get '/facebook_auth' do
	user = FBHelper.get_new_access_token(params[:code])
	session[:user_id] = user.id
	redirect to '/'
end

get '/logout' do 
	session[:user_id] = nil
	redirect to '/'
end

get '/playa' do 
	if !session[:user_id]
		redirect to '/'
	end
	erb :index
end


