class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |batman|
      batman.string :content
      batman.integer :character_id
    end
  end
end
