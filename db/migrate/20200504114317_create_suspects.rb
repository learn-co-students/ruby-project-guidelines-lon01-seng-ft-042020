class CreateSuspects < ActiveRecord::Migration[5.0]
  def change
    create_table :suspects do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :location
      t.string :hair_color
      t.string :one_thing_about
      t.boolean :into_tech
      t.boolean :drinks_alcohol
      t.boolean :multilingual
      t.timestamps
    end
  end
end
