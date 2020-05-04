class CreateProjects < ActiveRecord::Migration
  def change
    create_table :project do |t|
      t.string :name
      t.string :category
      t.integer :developer_id
      t.integer :user_id
    end
  end
end
