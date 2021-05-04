# I want our login flow to just require a username
# when they enter a username, it will find that user if it exists already, or it will create one

class User < ActiveRecord::Base
  has_many :messages
  has_many :characters, through: :messages
  has_secure_password
  validates :username, uniqueness: :true

  # def password=(password)
  #   self.password_digest = BCrypt::Password.create(password)
  # end

  # def authenticate(password)
  #   bcrypt = BCrypt::Password.new(self.password_digest)
  #   bcrypt == password && self
  # end

  # attr_accessor :username

  # @@all = []

  # def self.all
  #   @@all
  # end

  # def self.create(username)
  #   user = self.new
  #   user.username = username
  #   self.all << user
  #   return user
  # end

  # def self.find_by_username(username)
  #   self.all.find{|user| user.username == username}
  # end

  # def self.find_or_create(username)
  #   self.find_by_username(username) || self.create(username)
  # end

  # has many messages
  # def messages
  #   Message.all.select{|message| message.user == self}
  # end

  # has many characters through messages
  # def characters
  #   messages.map{|message| message.character}.uniq
  # end

  def print_messages
    messages.each do |message|
      puts "To #{message.character_name}: #{message.content}"
    end
  end

end
