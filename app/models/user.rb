class User < ActiveRecord::Base
  has_many :posts

  validates :name, presence: true
  validates :url_hash, presence: true, uniqueness: true

end
