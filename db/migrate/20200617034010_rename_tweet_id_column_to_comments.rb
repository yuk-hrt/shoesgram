class RenameTweetIdColumnToComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :tweet_id, :shoe_id
  end
end
