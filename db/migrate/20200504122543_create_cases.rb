class CreateCases < ActiveRecord::Migration[5.0]
  def change
    create_table :cases do |t|
      t.string :title
      t.integer :detective_id
      t.timestamp
    end
  end
end
