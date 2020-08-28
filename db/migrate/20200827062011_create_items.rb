class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :category_id, null: false
      t.integer :brand_id,    null: false
      t.integer :color_id
      t.integer :size_id
      t.integer :price
      t.date :purchase_date
      t.text :memo
      t.references :user,    foreign_key: true
      t.timestamps
    end
  end
end
