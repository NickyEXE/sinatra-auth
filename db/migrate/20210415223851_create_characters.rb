class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :birthday
      t.string :img
      t.string :occupation
      t.string :status
      t.string :actor
      t.string :nickname
    end
  end
end
