class CharactersController < ApplicationController

  # CREATE - New
  get "/characters/new" do
    erb :"characters/new"
  end

  # Read - Index
  get "/characters" do
    @characters = Character.all
    erb :"characters/index"
  end

  # Show
  get "/characters/:id" do
    # whatever's put in the id section gets added to params at a key of id
    @character = Character.find(params[:id])
    # this bit is just for a dropdown, it'll be refactored out when we have auth:
    @users = User.all
    erb :"characters/show"
  end

  # Create

  post "/characters" do
    redirect_if_not_logged_in
    character = Character.create(params["character"])
    redirect "/characters/#{character.id}"
  end

  # Edit

  get '/characters/:id/edit' do
    @character = Character.find(params[:id])
    erb :"characters/edit"
  end

  # Update

  patch '/characters/:id' do
    character = Character.find(params[:id])
    character.update(params["character"])
    redirect "/characters/#{character.id}"
  end

  # Delete

  delete '/characters/:id' do
    character = Character.find(params[:id])
    character.destroy
    redirect "/characters"
  end

  get "/cheese" do
    session[:cheese] = "gouda"
    erb :"characters/cheese"
  end


end
