# BreakingBadAPI.new.response.each{|character_hash| Character.new(character_hash)}

BreakingBadAPI.new.response.each do |character_hash|
  Character.create(
    name: character_hash["name"],
    birthday: character_hash["birthday"],
    img: character_hash["img"],
    occupation: character_hash["occupation"].join(", "),
    status: character_hash["status"],
    actor: character_hash["portrayed"],
    nickname: character_hash["nickname"]
  )
end


spongebob = User.find_or_create_by(username: "Spongebob Squarepants")
walt = Character.all.first
walt.messages.create(content: "Happy teacher appreciation day", user: spongebob)
walt.messages.create(content: "Keep grinding!", user: spongebob)
walt.messages.create(content: "Hi there!", user: spongebob)
