class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.integer :pages
      t.integer :author_id
      t.integer :genre_id
    end
  end
end
