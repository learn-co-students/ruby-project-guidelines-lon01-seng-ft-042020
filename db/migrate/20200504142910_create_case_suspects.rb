class CreateCaseSuspects < ActiveRecord::Migration[5.0]
  def change
    create_table :case_suspects do |t|
      t.integer :case_id
      t.integer :suspect_id
      t.boolean :guilt
      t.timestamps
    end
  end
end
