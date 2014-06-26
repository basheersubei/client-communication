class AddPhotoToComments < ActiveRecord::Migration
  def change
    add_attachment :comments, :photo
  end
end
