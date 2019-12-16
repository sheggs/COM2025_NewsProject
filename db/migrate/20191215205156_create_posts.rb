class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :body
      t.references :user, foreign_key: true
      t.string :title
      t.boolean :important
      t.string :summary
      t.boolean :comment_enabled

      t.timestamps
    end
  end
end
