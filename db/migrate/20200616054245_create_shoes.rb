class CreateShoes < ActiveRecord::Migration[6.0]
  def change
    create_table :shoes do |t|

      t.string :title
      t.text :text
      t.string :brand
      t.text :image
      t.timestamps
    end
  end
end
