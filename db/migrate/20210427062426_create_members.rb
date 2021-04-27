class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.integer :number, null: false
      t.text :name, null: false
      t.text :mail
      t.text :birthday
      t.text :comment

      t.boolean :administrator, null: false, default: false

      t.timestamps
    end
  end
end
