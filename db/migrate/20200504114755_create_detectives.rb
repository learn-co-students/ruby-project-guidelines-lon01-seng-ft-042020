class CreateDetectives < ActiveRecord::Migration[5.0]
  def change
    create_table :detectives do |t|
      t.string :name
      t.timestamp
    end
  end
end
