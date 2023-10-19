class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.integer :group_id
      t.integer :author_id
      t.float :amount
      
      t.timestamps
    end
  end
end
