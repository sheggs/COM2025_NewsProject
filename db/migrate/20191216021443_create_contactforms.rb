class CreateContactforms < ActiveRecord::Migration[5.2]
  def change
    create_table :contactforms do |t|
      t.string :title
      t.string :body
      t.string :email

      t.timestamps
    end
  end
end
