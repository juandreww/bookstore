class CreateBookCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :book_categories do |t|
      t.string :name, null: false
      t.integer :ordering, null: false
      t.timestamps
    end
  end
end
