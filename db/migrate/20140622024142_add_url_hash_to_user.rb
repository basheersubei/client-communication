class AddUrlHashToUser < ActiveRecord::Migration
  def change
    add_column :users, :url_hash, :string
  end
end
