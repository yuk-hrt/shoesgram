class AddIndexToShoes < ActiveRecord::Migration[6.0]
  def change
    add_index :shoes, :text, length: 32
  end
end
