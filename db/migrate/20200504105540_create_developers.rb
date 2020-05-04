class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developer do |t|
      t.string :name
      t.string :language
      t.string :email
    end
  end
end
