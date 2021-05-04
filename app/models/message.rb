class Message < ActiveRecord::Base
  belongs_to :character
  belongs_to :user

  # @@all = []
  # attr_reader :content, :character, :user

  # def initialize(content, character, user)
  #   @content, @character, @user = content, character, user
  #   @@all << self
  # end

  # def self.all
  #   @@all
  # end

  # def character
  #   Character.find(self.character_id)
  # end

  def username
    user.username
  end

  def character_name
    character.name
  end

end
