class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :info
      t.integer :price
      t.integer :category_id
      t.integer :condition_id
      t.integer :charge_id
      t.integer :prefecture_id
      t.integer :ship_day_id
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
