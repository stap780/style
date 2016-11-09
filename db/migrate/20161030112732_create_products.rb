class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :foto
      t.string :sku
      t.string :collection
      t.string :complect
      t.string :proba
      t.string :title
      t.string :category
      t.string :shortdesc
      t.string :gruppa
      t.string :vstavka
      t.string :metalcolor
      t.integer :size
      t.decimal :price
      t.integer :quantity
      t.integer :weight

      t.timestamps null: false
    end
  end
end
