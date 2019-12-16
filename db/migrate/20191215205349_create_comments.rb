class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.integer :likes, :default => 0, :null => false

      t.timestamps
    end
  end
end
