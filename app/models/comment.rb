class Comment < ActiveRecord::Base

  belongs_to :post
  validates :content, presence: true

  validates :post_id, presence: true
  validates :commenter, presence: true
	
	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

end
