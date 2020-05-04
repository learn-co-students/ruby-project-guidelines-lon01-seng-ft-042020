class CreateDevelopers < ActiveRecord::Migration[5.0]
  def change
    create_table :developers do |t|
      t.string :name
      t.integer :age
      t.string :language
      t.string :email
    end
  end
end
