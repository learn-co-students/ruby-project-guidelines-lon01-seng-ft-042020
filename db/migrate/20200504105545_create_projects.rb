class CreateProjects < ActiveRecord::Migration[4.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :category
      t.integer :developer_id
      t.integer :user_id
    end
  end
end
