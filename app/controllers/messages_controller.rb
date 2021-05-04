class MessagesController < ApplicationController

  post "/messages" do
    message = Message.create(params)
    redirect "characters/#{message.character.id}"
  end

end
