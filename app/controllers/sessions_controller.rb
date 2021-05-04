class SessionsController < ApplicationController

  get '/login' do
    erb :"sessions/login"
  end

  post '/sessions' do
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/characters"
    else
      @errors = ["Invalid username or password!"]
      erb :"sessions/login"
    end
  end

  get '/logout' do
    session.clear
    redirect "/login"
  end

end
