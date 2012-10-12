class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      # 8 points of significance, 2 digits after decimal point
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
