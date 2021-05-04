class UsersController < ApplicationController

  get "/users/new" do
    @user = User.new
    erb :"users/new"
  end

  post "/users" do
    @user = User.create(params)
    if @user.valid?
      redirect "users/#{@user.id}"
    else
      erb :"users/new"
    end
  end

  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"users/show"
  end

  get "/users" do
    @users = User.all
    erb :"users/index"
  end

end
