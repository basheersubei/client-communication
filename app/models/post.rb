class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
	
	belongs_to :user  
end
