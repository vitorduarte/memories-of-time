class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.decimal :lat
      t.decimal :long
      t.string :weather

      t.timestamps
    end
  end
end
