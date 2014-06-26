class FixAvatarNameToPhoto < ActiveRecord::Migration
  def change
    remove_attachment :posts, :avatar
    add_attachment :posts, :photo
  end
end
