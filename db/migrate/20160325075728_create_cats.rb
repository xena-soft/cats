class CreateCats < ActiveRecord::Migration

  def change
    create_table :cats do |t|
      t.string :name
      t.string :owner
      t.integer :age

      t.timestamps null: false
    end
  end
end
