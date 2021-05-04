class MessagesController < ApplicationController

  post "/messages" do
    message = current_user.messages.create(params)
    redirect "characters/#{message.character.id}"
  end

end
