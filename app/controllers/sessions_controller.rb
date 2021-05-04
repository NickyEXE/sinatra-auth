class SessionsController < ApplicationController

  get "/logout" do
    session.clear
    redirect "/login"
  end

  post "/sessions" do
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/characters"
    else
      @errors = ["Invalid username or password"]
      erb :"sessions/new"
    end
  end

  get "/login" do
    erb :"sessions/new"
  end


end
