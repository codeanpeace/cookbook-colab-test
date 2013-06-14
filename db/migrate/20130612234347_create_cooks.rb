class CreateCooks < ActiveRecord::Migration
  def change
    create_table :cooks do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.integer :age

      t.timestamps
    end
  end
end
